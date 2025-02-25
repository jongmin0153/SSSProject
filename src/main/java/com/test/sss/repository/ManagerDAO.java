package com.test.sss.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.test.sss.Manager;
import com.test.util.DBUtil;

public class ManagerDAO {

    private static ManagerDAO dao;

    private Connection conn;
    private Statement stat;
    private PreparedStatement pstat;
    private ResultSet rs;

    private ManagerDAO() {
        this.conn = DBUtil.open("SSSProject", "SSS", "java1234");
    }

    public static ManagerDAO getInstance() {
        if (dao == null) {
            dao = new ManagerDAO();
        }
        return dao;
    }

    // 특정 seq로 매니저 상세 정보 가져오기
    public Manager getManagerBySeq(String seq) {
        Manager manager = null;

        try {
            String sql = "SELECT * FROM tblManager WHERE seq = ?";
            pstat = conn.prepareStatement(sql);
            pstat.setString(1, seq);
            rs = pstat.executeQuery();

            if (rs.next()) {
                manager = new Manager();
                manager.setSeq(rs.getString("seq"));
                manager.setManNa(rs.getString("manNa"));
                manager.setManCon(rs.getString("manCon"));
                manager.setManBir(rs.getString("manBir"));
                manager.setManSty(rs.getString("manSty"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (pstat != null) pstat.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        return manager;
    }

    // 특정 StaticSeq로 매니저 리스트 가져오기
    public List<Manager> getManagersByStaticSeq(String staticSeq) {
        List<Manager> managers = new ArrayList<>();

        try {
            String sql = "SELECT seq, manNa, manCon, manBir, manSty FROM tblManager WHERE STATIC_SEQ = ?";
            pstat = conn.prepareStatement(sql);
            pstat.setString(1, staticSeq);
            rs = pstat.executeQuery();

            while (rs.next()) {
                Manager manager = new Manager();
                manager.setSeq(rs.getString("seq"));
                manager.setManNa(rs.getString("manNa"));
                manager.setManCon(rs.getString("manCon"));
                manager.setManBir(rs.getString("manBir"));
                manager.setManSty(rs.getString("manSty"));
                managers.add(manager);
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (pstat != null) pstat.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        return managers;
    }

    // 모든 매니저 데이터 가져오기
    public List<Manager> getAllManagers() {
        List<Manager> managers = new ArrayList<>();

        try {
            String sql = "SELECT seq, manNa, manCon, manBir, manSty FROM tblManager";
            stat = conn.createStatement();
            rs = stat.executeQuery(sql);

            while (rs.next()) {
                Manager manager = new Manager();
                manager.setSeq(rs.getString("seq"));
                manager.setManNa(rs.getString("manNa"));
                manager.setManCon(rs.getString("manCon"));
                manager.setManBir(rs.getString("manBir"));
                manager.setManSty(rs.getString("manSty"));
                managers.add(manager);
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (stat != null) stat.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        return managers;
    }
 // 특정 포메이션으로 매니저 리스트 가져오기
    public List<Manager> getManagersByFormation(String formation) {
        List<Manager> managers = new ArrayList<>();

        try {
            String sql = "SELECT seq, manNa, manCon, manBir, manSty " +
                         "FROM tblManager " +
                         "WHERE STATIC_SEQ = (SELECT seq FROM tblStatic WHERE formation = ?)";
            pstat = conn.prepareStatement(sql);
            pstat.setString(1, formation);
            rs = pstat.executeQuery();

            while (rs.next()) {
                Manager manager = new Manager();
                manager.setSeq(rs.getString("seq"));
                manager.setManNa(rs.getString("manNa"));
                manager.setManCon(rs.getString("manCon"));
                manager.setManBir(rs.getString("manBir"));
                manager.setManSty(rs.getString("manSty"));
                managers.add(manager);
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (pstat != null) pstat.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        return managers;
    }

}
