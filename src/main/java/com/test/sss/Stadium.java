package com.test.sss;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Stadium {

	private String seq;
	private String seqTeam;
	private String stadNa;
	private String capacity;
	public String getSeq() {
		return seq;
	}
	public void setSeq(String seq) {
		this.seq = seq;
	}
	public String getSeqTeam() {
		return seqTeam;
	}
	public void setSeqTeam(String seqTeam) {
		this.seqTeam = seqTeam;
	}
	public String getStadNa() {
		return stadNa;
	}
	public void setStadNa(String stadNa) {
		this.stadNa = stadNa;
	}
	public String getCapacity() {
		return capacity;
	}
	public void setCapacity(String capacity) {
		this.capacity = capacity;
	}
	
	
}
