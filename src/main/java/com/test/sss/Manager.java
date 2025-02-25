package com.test.sss;

public class Manager {

	private String seq;
	private String manNa;
	private String manCon;
	private String manBir;
	private String manSty;
	private String formation;
    private Team team; // 소속 팀
	private String TeamNa;
	

	public String getTeamNa() {
		return TeamNa;
	}
	public void setTeamNa(String teamNa) {
		TeamNa = teamNa;
	}
	public Team getTeam() {
		return team;
	}
	public void setTeam(Team team) {
		this.team = team;
	}
	public String getFormation() {
		return formation;
	}
	public void setFormation(String formation) {
		this.formation = formation;
	}
	public String getSeq() {
		return seq;
	}
	public void setSeq(String seq) {
		this.seq = seq;
	}
	public String getManNa() {
		return manNa;
	}
	public void setManNa(String manNa) {
		this.manNa = manNa;
	}
	public String getManCon() {
		return manCon;
	}
	public void setManCon(String manCon) {
		this.manCon = manCon;
	}
	public String getManBir() {
		return manBir;
	}
	public void setManBir(String manBir) {
		this.manBir = manBir;
	}
	public String getManSty() {
		return manSty;
	}
	public void setManSty(String manSty) {
		this.manSty = manSty;
	}

	
}
