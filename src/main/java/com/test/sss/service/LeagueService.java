package com.test.sss.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.test.sss.League;
import com.test.sss.util.DBUtil;

public class LeagueService {

	public static List<League> getAllLeagues() {
		
		List<League> leagueList = new ArrayList<>();
		
		String sql = "select * from tblLeague";
		
		try (Connection conn = DBUtil.getConnection();
	            PreparedStatement pstmt = conn.prepareStatement(sql);
	            ResultSet rs = pstmt.executeQuery();)
			{
			while (rs.next()) {
				League league = new League();
				league.setSeq(rs.getString("seq"));
				league.setLeagueNa(rs.getString("leagueNa"));
				league.setLeagueEs(rs.getString("leagueEs"));
				league.setLeagueCo(rs.getString("leagueCo"));
				league.setLeagueRec(rs.getString("leagueRec"));
				
				leagueList.add(league);
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return leagueList;
	}

}
