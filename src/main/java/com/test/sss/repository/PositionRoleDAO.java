package com.test.sss.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import com.test.sss.PositionRole;
import com.test.sss.Player;
import com.test.sss.util.DBUtil;

public class PositionRoleDAO {

    private static PositionRoleDAO instance = new PositionRoleDAO();

    private PositionRoleDAO() {}

    public static PositionRoleDAO getInstance() {
        return instance;
    }

    // ✅ 1. 전체 포지션 목록 가져오기
    public List<PositionRole> getAllPositionRoles() {
        List<PositionRole> positionRoles = new ArrayList<>();
        String sql = "SELECT * FROM tblPositionRole";

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement pstat = conn.prepareStatement(sql);
             ResultSet rs = pstat.executeQuery()) {

            while (rs.next()) {
                PositionRole positionRole = new PositionRole();
                positionRole.setSeq(rs.getString("SEQ"));
                positionRole.setPositionNa(rs.getString("POSITIONNA"));
                positionRole.setPositionCate(rs.getString("POSITIONCATE"));
                positionRole.setPositionInf(rs.getString("POSITIONINF"));

                positionRoles.add(positionRole);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return positionRoles;
    }

    // ✅ 2. 특정 포지션과 역할에 대한 정보 가져오기
    public PositionRole getPositionRole(String positionNa, String positionCate) {
        PositionRole positionRole = null;
        String sql = "SELECT * FROM tblPositionRole WHERE POSITIONNA = ? AND POSITIONCATE = ?";

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement pstat = conn.prepareStatement(sql)) {

            pstat.setString(1, positionNa);
            pstat.setString(2, positionCate);
            ResultSet rs = pstat.executeQuery();

            if (rs.next()) {
                positionRole = new PositionRole();
                positionRole.setSeq(rs.getString("SEQ"));
                positionRole.setPositionNa(rs.getString("POSITIONNA"));
                positionRole.setPositionCate(rs.getString("POSITIONCATE"));
                positionRole.setPositionInf(rs.getString("POSITIONINF"));
            }
            rs.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return positionRole;
    }

    // ✅ 3. 특정 포지션과 역할에 속한 선수 목록 가져오기
    public List<Player> getPlayersByPosition(String positionNa, String positionCate) {
        List<Player> players = new ArrayList<>();
        String sql = "SELECT p.PLAYERNA, p.PLAYERNU, p.PLAYERCON, p.PLAYERHE, p.PLAYERPREFOOT, " +
                     "p.PLAYERBIR, t.TEAMNA, pp.POSITIONNA, pp.POSITIONCATE " +
                     "FROM tblPlayer p " +
                     "JOIN tblTeam t ON p.SEQTEAM = t.SEQ " +
                     "JOIN tblPositionRole pp ON p.SEQPOSITIONROLE = pp.SEQ " +
                     "WHERE pp.POSITIONNA = ? AND pp.POSITIONCATE = ?";

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement pstat = conn.prepareStatement(sql)) {

            pstat.setString(1, positionNa);
            pstat.setString(2, positionCate);
            ResultSet rs = pstat.executeQuery();

            while (rs.next()) {
                Player player = new Player();
                player.setPlayerNa(rs.getString("PLAYERNA"));
                player.setPlayerNu(rs.getString("PLAYERNU"));
                player.setPlayerCon(rs.getString("PLAYERCON"));
                player.setPlayerHe(rs.getString("PLAYERHE"));
                player.setPlayerPreFoot(rs.getString("PLAYERPREFOOT"));
                player.setPlayerBir(rs.getString("PLAYERBIR"));
                player.setTeamNa(rs.getString("TEAMNA"));
                player.setPlayerPos(rs.getString("POSITIONNA"));
                player.setPlayerMinPos(rs.getString("POSITIONCATE"));

                players.add(player);
            }
            rs.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return players;
    }
}
