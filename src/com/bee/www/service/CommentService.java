package com.bee.www.service;

import com.bee.www.dao.BoardDAO;
import com.bee.www.dao.CommentDAO;
import com.bee.www.vo.ArticleVo;
import com.bee.www.vo.CommentVo;
import com.bee.www.vo.MemberVo;

import java.sql.Connection;
import java.util.ArrayList;

import static com.bee.www.common.JdbcUtil.*;

public class CommentService {
    //글쓰기 메소드
    public boolean insertComment(CommentVo vo) {
        //세팅
        CommentDAO dao = CommentDAO.getInstance();
        Connection con = getConnection();
        dao.setConnection(con);
        boolean isSucess = false;

        int count = dao.insertComment(vo);
        if (count > 0) {    //성공
            commit(con);
            isSucess = true;
        } else {          //실패
            rollback(con);
        }
        close(con);
        return isSucess;
    }

    //글삭제 메소드
    public boolean deleteComment(int num) {
        //세팅
        CommentDAO dao = CommentDAO.getInstance();
        Connection con = getConnection();
        dao.setConnection(con);
        boolean isSucess = false;

        int count = dao.deleteComment(num);
        if (count > 0) {    //성공
            commit(con);
            isSucess = true;
        } else {          //실패
            rollback(con);
        }
        close(con);
        return isSucess;
    }

    //학원정보,자유게시판 리스트 불러오기
    public ArrayList<CommentVo> getCommentList(int num) {
        CommentDAO dao = CommentDAO.getInstance();
        Connection con = getConnection();
        dao.setConnection(con);

        ArrayList<CommentVo> list = dao.getCommentList(num);
        close(con);

        return list;
    }

    //댓글 등록할 때 로그인 되어있는 id 시퀀스 찾는 메소드
    public int getMemberSequence(String id) {
        BoardDAO dao = BoardDAO.getInstance();
        Connection con = getConnection();
        dao.setConnection(con);

        int sq = dao.getMemberSequence(id);
        close(con);
        return sq;
    }

}
