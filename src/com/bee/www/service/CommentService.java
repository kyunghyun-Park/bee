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
    //댓글쓰기 메소드
    public int insertComment(CommentVo vo) {
        //세팅
        CommentDAO dao = CommentDAO.getInstance();
        Connection con = getConnection();
        dao.setConnection(con);

        int count = dao.insertComment(vo);
        if (count > 0) {    //성공
            commit(con);
        } else {          //실패
            rollback(con);
        }
        close(con);
        return count;
    }
    //댓글수정 메소드
    public int modifyComment(CommentVo vo) {
        //세팅
        CommentDAO dao = CommentDAO.getInstance();
        Connection con = getConnection();
        dao.setConnection(con);

        int count = dao.modifyComment(vo);
        if (count > 0) {    //성공
            commit(con);
        } else {          //실패
            rollback(con);
        }
        close(con);
        return count;
    }
    //댓글삭제 메소드
    public int deleteComment(int num) {
        //세팅
        CommentDAO dao = CommentDAO.getInstance();
        Connection con = getConnection();
        dao.setConnection(con);

        int count = dao.deleteComment(num);
        if (count > 0) {    //성공
            commit(con);
        } else {          //실패
            rollback(con);
        }
        close(con);
        return count;
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
    public int getCommentCount(int num){
        CommentDAO dao = CommentDAO.getInstance();
        Connection con = getConnection();
        dao.setConnection(con);

        int count=dao.getCommentCount(num);
        close(con);
        return count;
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
