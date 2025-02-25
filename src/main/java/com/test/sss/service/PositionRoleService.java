package com.test.sss.service;

import java.util.List;
import com.test.sss.PositionRole;
import com.test.sss.repository.PositionRoleDAO;

public class PositionRoleService {

    private PositionRoleDAO dao;

    public PositionRoleService() {
        this.dao = PositionRoleDAO.getInstance();
    }

    public List<PositionRole> getAllPositionRoles() {
        return dao.getAllPositionRoles();
    }

    public PositionRole getPositionRoleWithPlayers(String positionNa, String positionCate) {
        PositionRole positionRole = dao.getPositionRole(positionNa, positionCate);

        if (positionRole != null) {
            positionRole.setPlayers(dao.getPlayersByPosition(positionNa, positionCate));
        }

        return positionRole;
    }
}
