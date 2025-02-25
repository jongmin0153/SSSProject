package com.test.sss;

import java.util.List;

public class StaticData {

    // 전술 정보
    private String seq;
    private String formation;
    private String formInf;
    private String formPros;
    private String formCons;

    // 감독 정보
    private Manager manager;
    private String manNa;
    private String manBir;
    private String manSty;

    // Getter, Setter
    public String getSeq() {
        return seq;
    }

    public void setSeq(String seq) {
        this.seq = seq;
    }

    public String getFormation() {
        return formation;
    }

    public void setFormation(String formation) {
        this.formation = formation;
    }

    public String getFormInf() {
        return formInf;
    }

    public void setFormInf(String formInf) {
        this.formInf = formInf;
    }

    public String getFormPros() {
        return formPros;
    }

    public void setFormPros(String formPros) {
        this.formPros = formPros;
    }

    public String getFormCons() {
        return formCons;
    }

    public void setFormCons(String formCons) {
        this.formCons = formCons;
    }

    // 감독 정보에 대한 Getter, Setter
    public Manager getManager() {
        return manager;
    }

    public void setManager(Manager manager) {
        this.manager = manager;
    }

    public String getManNa() {
        return manNa;
    }

    public void setManNa(String manNa) {
        this.manNa = manNa;
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
