package com.bee.www.service;

import com.bee.www.dao.BoardDAO;
import com.bee.www.vo.MemberVo;

import java.sql.Connection;

import static com.bee.www.common.JdbcUtil.*;

public class BoardService {
    public boolean joinMember(MemberVo memberVo) {
        BoardDAO dao = BoardDAO.getInstance();
        Connection con = getConnection();
        dao.setConnection(con);
        boolean isSucess = false;

        int result = dao.insertMember(memberVo);
        if (result == 1) {
            commit(con);
            isSucess=true;
        }else{
            rollback(con);
        }
        close(con);
        return isSucess;
    }
}
