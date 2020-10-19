package com.bee.www.service;

import com.bee.www.common.Pagenation;
import com.bee.www.dao.BoardDAO;
import com.bee.www.dao.MemberDAO;
import com.bee.www.vo.ArticleVo;
import com.bee.www.vo.CommentVo;
import com.bee.www.vo.MemberVo;

import java.sql.Connection;
import java.util.ArrayList;

import static com.bee.www.common.JdbcUtil.*;

public class BoardService {
    public int getArticleCount(String query){
        BoardDAO dao = BoardDAO.getInstance();
        Connection con = getConnection();
        dao.setConnection(con);

        int count=dao.getArticleCount(query);
        close(con);
        return count;
    }
    //작성자 id구하는 메소드
    public String getWriterId(int num) {
        BoardDAO dao = BoardDAO.getInstance();
        Connection con = getConnection();
        dao.setConnection(con);

        String id = dao.getWriterId(num); //dao에서 구함

        close(con);
        return id;
    }

    //학원정보게시판에 지역이름보이게 하기
    public String getCateName(int c_sq) {
        BoardDAO dao = BoardDAO.getInstance();
        Connection con = getConnection();
        dao.setConnection(con);

        String cate_name = dao.getCateName(c_sq);

        close(con);
        return cate_name;
    }

    //자유게시판 글 등록할 때 로그인 되어있는 id 시퀀스 찾는 메소드
    public int getMemberSequence(String id) {
        BoardDAO dao = BoardDAO.getInstance();
        Connection con = getConnection();
        dao.setConnection(con);

        int sq = dao.getMemberSequence(id);
        close(con);
        return sq;
    }

    //글쓰기 메소드
    public boolean insertArticle(ArticleVo vo) {
        //세팅
        BoardDAO dao = BoardDAO.getInstance();
        Connection con = getConnection();
        dao.setConnection(con);
        //그냥 count넘겨도 되지만 boolean으로 함
        boolean isSucess = false;

        int count = dao.insertArticle(vo);
        if (count > 0) {    //성공
            commit(con);
            isSucess = true;
        } else {          //실패
            rollback(con);
        }
        close(con);
        return isSucess;
    }
    //글수정 메소드
    public boolean updateArticle(ArticleVo vo) {
        //세팅
        BoardDAO dao = BoardDAO.getInstance();
        Connection con = getConnection();
        dao.setConnection(con);
        boolean isSucess = false;

        int count = dao.updateArticle(vo);
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
    public boolean deleteArticle(int num) {
        //세팅
        BoardDAO dao = BoardDAO.getInstance();
        Connection con = getConnection();
        dao.setConnection(con);
        boolean isSucess = false;

        int count = dao.deleteArticle(num);
        if (count > 0) {    //성공
            commit(con);
            isSucess = true;
        } else {          //실패
            rollback(con);
        }
        close(con);
        return isSucess;
    }

    //리뷰쓰기 메소드
    public boolean insertReviews(ArticleVo vo) {
        //세팅
        BoardDAO dao = BoardDAO.getInstance();
        Connection con = getConnection();
        dao.setConnection(con);
        //그냥 count넘겨도 되지만 boolean으로 함
        boolean isSucess = false;

        int count = dao.insertReviews(vo);
        if (count > 0) {    //성공
            commit(con);
            isSucess = true;
        } else {          //실패
            rollback(con);
        }
        close(con);
        return isSucess;
    }
    //조회수 증가
    public boolean updateHitCount(int num) {
        //세팅
        BoardDAO dao = BoardDAO.getInstance();
        Connection con = getConnection();
        dao.setConnection(con);
        boolean isSucess = false;

        int count = dao.updateHitCount(num);
        if (count > 0) {    //성공
            commit(con);
            isSucess=true;
        } else {          //실패
            rollback(con);
        }

        close(con);
        return isSucess;
    }
    //학원정보,자유게시판 리스트 불러오기
    public ArrayList<ArticleVo> getArticleList(Pagenation pagenation,String query) {
        BoardDAO dao = BoardDAO.getInstance();
        Connection con = getConnection();
        dao.setConnection(con);

        ArrayList<ArticleVo> list = dao.getArticleList(pagenation,query);
        close(con);

        return list;
    }

    //오늘의 공부 리스트
    public ArrayList<ArticleVo> getReviewsList() {
        BoardDAO dao = BoardDAO.getInstance();
        Connection con = getConnection();
        dao.setConnection(con);

        ArrayList<ArticleVo> list = dao.getReviewsList();
        close(con);

        return list;
    }
    //글 내용보기
    public ArticleVo getArticleDetail(int num) {
        BoardDAO dao = BoardDAO.getInstance();
        Connection con = getConnection();
        dao.setConnection(con);

        ArticleVo vo = dao.getArticleDetail(num);
        close(con);

        return vo;
    }


}
