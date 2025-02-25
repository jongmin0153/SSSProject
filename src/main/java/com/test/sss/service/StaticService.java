/*
 * package com.test.sss.service;
 * 
 * import java.sql.Connection; import java.sql.PreparedStatement; import
 * java.sql.ResultSet; import java.sql.SQLException; import java.util.ArrayList;
 * import java.util.List;
 * 
 * import com.test.sss.StaticData; import com.test.sss.Manager; import
 * com.test.sss.util.DBUtil;
 * 
 * public class StaticService {
 * 
 * // **전술 리스트 가져오기** public List<StaticData> getTacticsList() {
 * List<StaticData> tacticsList = new ArrayList<>(); String sql =
 * "SELECT seq, formation, formInf, formPros, formCons FROM tblStatic";
 * 
 * try (Connection conn = DBUtil.getConnection(); PreparedStatement pstmt =
 * conn.prepareStatement(sql); ResultSet rs = pstmt.executeQuery()) {
 * 
 * while (rs.next()) { StaticData data = new StaticData();
 * data.setSeq(rs.getString("seq"));
 * data.setFormation(rs.getString("formation"));
 * data.setFormInf(rs.getString("formInf"));
 * data.setFormPros(rs.getString("formPros"));
 * data.setFormCons(rs.getString("formCons"));
 * 
 * tacticsList.add(data); }
 * 
 * } catch (SQLException | ClassNotFoundException e) { e.printStackTrace(); }
 * return tacticsList; }
 * 
 * // **전술과 감독 정보를 함께 가져오기 (뷰 사용)** public List<StaticData>
 * getTacticsWithManagersList(int seq) { List<StaticData>
 * tacticsWithManagersList = new ArrayList<>(); String sql =
 * "SELECT seq, formation, formInf, formPros, formCons, manNa, manBir, manSty "
 * + "FROM vw_Tactic_Managers WHERE seq = ?";
 * 
 * try (Connection conn = DBUtil.getConnection(); PreparedStatement pstmt =
 * conn.prepareStatement(sql)) {
 * 
 * pstmt.setInt(1, seq); // 전술 seq 바인딩 try (ResultSet rs = pstmt.executeQuery())
 * { while (rs.next()) { StaticData data = new StaticData();
 * data.setSeq(rs.getString("seq"));
 * data.setFormation(rs.getString("formation"));
 * data.setFormInf(rs.getString("formInf"));
 * data.setFormPros(rs.getString("formPros"));
 * data.setFormCons(rs.getString("formCons"));
 * 
 * // 감독 정보 설정 Manager manager = new Manager();
 * manager.setManNa(rs.getString("manNa"));
 * manager.setManBir(rs.getString("manBir"));
 * manager.setManSty(rs.getString("manSty"));
 * 
 * data.setManager(manager); tacticsWithManagersList.add(data); } }
 * 
 * } catch (SQLException | ClassNotFoundException e) { e.printStackTrace(); }
 * return tacticsWithManagersList; } }
 */