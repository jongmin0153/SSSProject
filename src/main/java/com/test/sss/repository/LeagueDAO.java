package com.test.sss.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import com.test.sss.League;
import com.test.util.DBUtil;

public class LeagueDAO {

	private static LeagueDAO dao;
	
	
	private Connection conn;
    private Statement stat;
    private PreparedStatement pstat;
    private ResultSet rs;
	
    private LeagueDAO() {
    	this.conn = DBUtil.open("SSSProject", "SSS", "java1234");
    }
    public League getLeagueBySeq (String seq)  {
    	
    	League league = null;
    	
    	try {
			
    		String sql = "select * from tblLeague where seq = ?";
    		
    		pstat = conn.prepareStatement(sql);
			pstat.setString(1, seq);
			
			rs = pstat.executeQuery();
    		
		} catch (Exception e) {
			e.printStackTrace();
		}
    	
    	return league;
    }
    
}
