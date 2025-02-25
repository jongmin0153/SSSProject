package com.test.sss.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import com.test.sss.Team;
import com.test.util.DBUtil;

public class TeamDAO {

	private static TeamDAO dao;
	
	private Connection conn;
    private Statement stat;
    private PreparedStatement pstat;
    private ResultSet rs;
		
	private TeamDAO() {
		this.conn = DBUtil.open("SSSProject", "SSS", "java1234");
	}
	public Team getAllTeams(String seq) {
		
		Team team = null;
		
		try {
			
			String sql = "select * from tblTeam";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, seq);
			
			rs = pstat.executeQuery();
			
		} catch (Exception e) {
			e.printStackTrace();
			
		}
		return team;
		
	}
	
}
