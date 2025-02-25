package com.test.sss.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.test.sss.Team;
import com.test.sss.util.DBUtil;

public class TeamService {

	public List<Team> getAllTeams() {
		List<Team> teamList = new ArrayList<>();
		
		String sql = "select * from tblTeam";
		
		  try (Connection conn = DBUtil.getConnection();
		         PreparedStatement pstmt = conn.prepareStatement(sql);
		         ResultSet rs = pstmt.executeQuery()) {
			  
			  while (rs.next()) {
				  Team team = new Team();
				  team.setSeq(rs.getString("seq"));
				  team.setSeq(rs.getString("seqLeague"));
				  team.setSeq(rs.getString("seqManager"));
				  team.setSeq(rs.getString("teamNa"));
				
				  teamList.add(team);
			  }
				  
			  } catch (Exception e) {
				  e.printStackTrace();
			  }
		  
		  return teamList;
	}
}
