package com.test.sss.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.test.sss.util.DBUtil;

public class ManagerStaticService {

    public List<String[]> getManagersByFormation(String formation) {
        List<String[]> list = new ArrayList<>();
        
        String sql = "SELECT seqStatic, formation, formInf, formPros, formCons, managerName, managerBirth, nationality FROM vw_Tactic_Managers WHERE formation = ?";
        
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, formation);
            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    String[] data = new String[8];
                    data[0] = rs.getString("seqStatic");      // 전술 고유번호
                    data[1] = rs.getString("formation");      // 포메이션
                    data[2] = rs.getString("formInf");        // 전술 설명
                    data[3] = rs.getString("formPros");       // 전술 장점
                    data[4] = rs.getString("formCons");       // 전술 단점
                    data[5] = rs.getString("managerName");    // 감독 이름
                    data[6] = rs.getString("managerBirth");   // 감독 생년월일
                    data[7] = rs.getString("nationality");    // 감독 국적
                    list.add(data);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return list;
    }
}
