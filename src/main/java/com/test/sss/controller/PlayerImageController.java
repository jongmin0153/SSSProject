package com.test.sss.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/playerImage")
public class PlayerImageController extends HttpServlet {
    private static final String IMAGE_DIRECTORY = "C:/class/SSSProject/src/main/webapp/images/players/";

    private static final Map<String, String> playerImages = new HashMap<>();

    static {
        playerImages.put("Rodri", "Rodri.jpg");
        playerImages.put("KyleWalker", "Kyle Walker.jpg"); // 공백 제거
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String playerName = req.getParameter("name");
        if (playerName == null || playerName.isEmpty()) {
            resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Player name is missing");
            return;
        }

        playerName = playerName.replace(" ", ""); // 공백 제거
        String fileName = playerImages.getOrDefault(playerName, "default.jpg");
        String imagePath = IMAGE_DIRECTORY + fileName;

        File imageFile = new File(imagePath);
        System.out.println("Requested player name: " + playerName);
        System.out.println("Resolved file name: " + fileName);
        System.out.println("Resolved file path: " + imagePath);
        System.out.println("File exists: " + imageFile.exists());

        if (!imageFile.exists() || !imageFile.isFile()) {
            System.err.println("Image not found for player: " + playerName);
            resp.sendError(HttpServletResponse.SC_NOT_FOUND, "Image not found");
            return;
        }

        resp.setContentType(getMimeType(fileName));
        resp.setHeader("Cache-Control", "no-store, no-cache, must-revalidate");
        resp.setHeader("Pragma", "no-cache");
        resp.setDateHeader("Expires", 0);

        try (FileInputStream fis = new FileInputStream(imageFile);
             OutputStream os = resp.getOutputStream()) {
            byte[] buffer = new byte[1024];
            int bytesRead;
            while ((bytesRead = fis.read(buffer)) != -1) {
                os.write(buffer, 0, bytesRead);
            }
        }
    }

    private String getMimeType(String fileName) {
        if (fileName.endsWith(".jpg") || fileName.endsWith(".jpeg")) {
            return "image/jpeg";
        } else if (fileName.endsWith(".png")) {
            return "image/png";
        } else if (fileName.endsWith(".gif")) {
            return "image/gif";
        }
        return "application/octet-stream";
    }
}
