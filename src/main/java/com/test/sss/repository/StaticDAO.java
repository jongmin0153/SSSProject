package com.test.sss.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.test.sss.StaticData;
import com.test.util.DBUtil;

public class StaticDAO {

	private static StaticDAO dao;
	
	private Connection conn;
    private Statement stat;
    private PreparedStatement pstat;
    private ResultSet rs;
    
    private StaticDAO() {
    	this.conn = DBUtil.open("SSSProject", "SSS", "java1234");
    }
    public StaticData getAllStatics(String seq) {

        StaticData staticData = null;

        try {
            String sql = "SELECT * FROM tblStatic WHERE seq = ?";
            pstat = conn.prepareStatement(sql);
            pstat.setString(1, seq);

            rs = pstat.executeQuery();

            if (rs.next()) {
                staticData = new StaticData(); // Static 객체 생성
                staticData.setSeq(rs.getString("seq")); // tblStatic의 seq 필드 매핑
                staticData.setFormation(rs.getString("formation")); // tblStatic의 formation 필드 매핑
                // 필요한 다른 필드들도 설정
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

        return staticData;
    }
    
    public StaticData getStaticByFormation(String formation) {
        StaticData staticData = null;

        try {
            String sql = "SELECT * FROM tblStatic WHERE formation = ?";
            pstat = conn.prepareStatement(sql);
            pstat.setString(1, formation);

            rs = pstat.executeQuery();

            if (rs.next()) {
                staticData = new StaticData();
                staticData.setSeq(rs.getString("seq"));
                staticData.setFormation(rs.getString("formation"));
                staticData.setFormInf(rs.getString("formInf"));
                staticData.setFormPros(rs.getString("formPros"));
                staticData.setFormCons(rs.getString("formCons"));
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

        return staticData;
    }
    
    public List<StaticData> getAllFormations() {
        List<StaticData> list = new ArrayList<>();

        try {
            String sql = "SELECT * FROM tblStatic";
            stat = conn.createStatement();
            rs = stat.executeQuery(sql);

            while (rs.next()) {
                StaticData staticData = new StaticData();
                staticData.setSeq(rs.getString("seq"));
                staticData.setFormation(rs.getString("formation"));
                staticData.setFormInf(rs.getString("formInf"));
                staticData.setFormPros(rs.getString("formPros"));
                staticData.setFormCons(rs.getString("formCons"));

                list.add(staticData);
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

        return list;
    }



    
}
