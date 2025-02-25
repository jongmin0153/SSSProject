package com.test.sss;

import java.util.List;

public class PositionRole {
    
    private String seq;
    private String positionNa;
    private String positionCate;
    private String positionInf;
    private List<Player> players; // 선수 리스트 추가

    // 기본 생성자
    public PositionRole() {}

    // 모든 필드를 포함하는 생성자
    public PositionRole(String seq, String positionNa, String positionCate, String positionInf, List<Player> players) {
        this.seq = seq;
        this.positionNa = positionNa;
        this.positionCate = positionCate;
        this.positionInf = positionInf;
        this.players = players;
    }

    // Getter & Setter
    public String getSeq() {
        return seq;
    }

    public void setSeq(String seq) {
        this.seq = seq;
    }

    public String getPositionNa() {
        return positionNa;
    }

    public void setPositionNa(String positionNa) {
        this.positionNa = positionNa;
    }

    public String getPositionCate() {
        return positionCate;
    }

    public void setPositionCate(String positionCate) {
        this.positionCate = positionCate;
    }

    public String getPositionInf() {
        return positionInf;
    }

    public void setPositionInf(String positionInf) {
        this.positionInf = positionInf;
    }

    public List<Player> getPlayers() {
        return players;
    }

    public void setPlayers(List<Player> players) {
        this.players = players;
    }
}
