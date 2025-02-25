package com.test.sss.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import com.test.sss.Player;
import com.test.util.DBUtil;

public class PlayerDAO {

	private static PlayerDAO dao;
	
	private Connection conn;
    private Statement stat;
    private PreparedStatement pstat;
    private ResultSet rs;
    
    private PlayerDAO() {
    	this.conn = DBUtil.open("SSSProject", "SSS", "java1234");
    }
 
    
    public Player getPlayerByName(String playerNa) {
    	
    	Player player = null;
    	
    	String sql = "select * from tblPlayer where playerNa = ?";
    	
    	try (PreparedStatement pstat = conn.prepareStatement(sql)) {
            pstat.setString(1, playerNa);
            try (ResultSet rs = pstat.executeQuery()) {
                if (rs.next()) {
                    player = new Player();
                    player.setSeq(rs.getString("seq"));
                    player.setSeqTeam(rs.getString("seqTeam"));
                    player.setSeqPositionRole(rs.getString("seqPositionRole"));
                    player.setPlayerNa(rs.getString("playerNa"));
                    player.setPlayerCon(rs.getString("playerCon"));
                    player.setPlayerHe(rs.getString("playerHe"));
                    player.setPlayerPreFoot(rs.getString("playerPreFoot"));
                    player.setPlayerBir(rs.getString("playerBir"));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    	
    	
    	
    	return player;
    }
}
