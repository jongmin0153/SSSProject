package com.test.sss.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.test.sss.Player;
import com.test.sss.repository.PlayerDAO;
import com.test.sss.util.DBUtil;

public class PlayerService {
	
	private PlayerDAO playerDAO;

	public List<Player> getPlayerByName(String playerNa) {
	    List<Player> players = new ArrayList<>();
	    String sql = "SELECT p.playerNa, t.teamNa, pr.positionCate, p.playerNu, p.playerCon, " +
	                 "p.playerHe, p.playerPreFoot, p.playerBir, pp.mainPosition AS playerPos, " +
	                 "LISTAGG(mp.minorPositions, ', ') WITHIN GROUP (ORDER BY mp.minorPositions) AS playerMinPos " +
	                 "FROM tblPlayer p " +
	                 "JOIN tblTeam t ON p.seqTeam = t.seq " +
	                 "JOIN tblPositionRole pr ON p.seqPositionRole = pr.seq " +
	                 "LEFT JOIN tblPlayerPos pp ON pp.SEQPLAYER = p.SEQ " +
	                 "LEFT JOIN tblPlayerMinPos mp ON mp.SEQPOSITIONPOS = pp.SEQ " +
	                 "WHERE p.playerNa = ? " +
	                 "GROUP BY p.playerNa, t.teamNa, pr.positionCate, p.playerNu, p.playerCon, " +
	                 "p.playerHe, p.playerPreFoot, p.playerBir, pp.mainPosition";

	    try (Connection conn = DBUtil.getConnection();
	         PreparedStatement pstmt = conn.prepareStatement(sql)) {

	        pstmt.setString(1, playerNa);

	        try (ResultSet rs = pstmt.executeQuery()) {
	            while (rs.next()) {
	                Player player = new Player();
	                player.setPlayerNa(rs.getString("playerNa")); // 선수 이름
	                player.setTeamNa(rs.getString("teamNa")); // 팀 이름
	                player.setPositionCate(rs.getString("positionCate")); // 포지션 역할
	                player.setPlayerNu(rs.getString("playerNu")); // 등번호
	                player.setPlayerCon(rs.getString("playerCon")); // 국적
	                player.setPlayerHe(rs.getString("playerHe")); // 신장
	                player.setPlayerPreFoot(rs.getString("playerPreFoot")); // 주발
	                player.setPlayerBir(rs.getString("playerBir")); // 출생일
	                player.setPlayerPos(rs.getString("playerPos")); // 주 포지션
	                player.setPlayerMinPos(rs.getString("playerMinPos")); // 부 포지션
	                players.add(player);
	            }
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return players;
	}
}
