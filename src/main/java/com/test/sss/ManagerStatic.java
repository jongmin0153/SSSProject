package com.test.sss;

public class ManagerStatic {

    // tblManStatic의 기본 필드
    private String seq; // tblManStatic 기본 키
    private String seqManager; // tblManager 외래 키
    private String seqStatic; // tblStatic 외래 키

    // tblManager 관련 필드
    private String manNa; // 감독 이름
    private String manCon; // 감독 국가
    private String manBir; // 감독 생년월일
    private String manSty; // 감독 스타일
    private String formation; // 감독이 사용하는 포메이션

    // tblStatic 관련 필드
    
    private String staticFormation; // 포메이션 이름
    private String staticFormInf; // 포메이션 설명
    private String staticFormPros; // 포메이션 장점
    private String staticFormCons; // 포메이션 단점
    

    // Getters and Setters
    public String getSeq() {
        return seq;
    }

    public void setSeq(String seq) {
        this.seq = seq;
    }

    public String getSeqManager() {
        return seqManager;
    }

    public void setSeqManager(String seqManager) {
        this.seqManager = seqManager;
    }

    public String getSeqStatic() {
        return seqStatic;
    }

    public void setSeqStatic(String seqStatic) {
        this.seqStatic = seqStatic;
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

    public String getFormation() {
        return formation;
    }

    public void setFormation(String formation) {
        this.formation = formation;
    }
    public String getStaticFormation() {
        return staticFormation;
    }

    public void setStaticFormation(String staticFormation) {
        this.staticFormation = staticFormation;
    }

    public String getStaticFormInf() {
        return staticFormInf;
    }

    public void setStaticFormInf(String staticFormInf) {
        this.staticFormInf = staticFormInf;
    }

    public String getStaticFormPros() {
        return staticFormPros;
    }

    public void setStaticFormPros(String staticFormPros) {
        this.staticFormPros = staticFormPros;
    }

    public String getStaticFormCons() {
        return staticFormCons;
    }

    public void setStaticFormCons(String staticFormCons) {
        this.staticFormCons = staticFormCons;
    }
}
