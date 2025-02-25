package com.test.sss.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.test.sss.Manager; // Manager 클래스 사용
import com.test.sss.Team;
import com.test.sss.repository.ManagerDAO;
import com.test.sss.util.DBUtil;

public class ManagerService {
	private ManagerDAO managerDAO;

	public List<Manager> getAllManagers() {
	    List<Manager> managerList = new ArrayList<>();

	    String sql = "SELECT " +
	                 "    m.seq AS managerSeq, " +
	                 "    m.manNa, " +
	                 "    m.manCon, " +
	                 "    m.manBir, " +
	                 "    m.manSty, " +
	                 "    t.seq AS teamSeq, " +
	                 "    t.teamNa " +
	                 "FROM tblManager m " +
	                 "LEFT JOIN tblTeam t " +
	                 "    ON m.seq = t.seqManager";

	    try (Connection conn = DBUtil.getConnection();
	         PreparedStatement pstmt = conn.prepareStatement(sql);
	         ResultSet rs = pstmt.executeQuery()) {

	        while (rs.next()) {
	            Manager manager = new Manager();
	            manager.setSeq(rs.getString("managerSeq"));
	            manager.setManNa(rs.getString("manNa"));
	            manager.setManCon(rs.getString("manCon"));
	            manager.setManBir(rs.getString("manBir"));
	            manager.setManSty(rs.getString("manSty"));

	            // 팀 이름 설정
	            if (rs.getString("teamNa") != null) {
	                manager.setTeamNa(rs.getString("teamNa")); // Manager 객체에 teamNa 필드 추가 필요
	            } else {
	                manager.setTeamNa("소속팀 없음");
	            }

	            managerList.add(manager);
	        }

	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return managerList;
	}

        public List<Manager> getManagersByFormation(String formation) {
        // DAO를 통해 매니저 데이터 가져오기
        return managerDAO.getManagersByFormation(formation);
    }

}
