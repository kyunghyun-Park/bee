package com.bee.www.service;

import com.bee.www.dao.BoardDAO;
import com.bee.www.vo.ArticleVo;
import com.bee.www.vo.CommentVo;
import com.bee.www.vo.MemberVo;

import java.sql.Connection;
import java.util.ArrayList;

import static com.bee.www.common.JdbcUtil.*;

public class BoardService {

    //회원가입 메소드
    public boolean joinMember(MemberVo memberVo) {
        BoardDAO dao = BoardDAO.getInstance();
        Connection con = getConnection();
        dao.setConnection(con);
        boolean isSucess = false;

        int result = dao.insertMember(memberVo); //dao호출
        if (result == 1) {
            commit(con);
            isSucess = true;
        } else {
            rollback(con);
        }
        close(con);
        return isSucess;
    }

    //입력한 아이디에 해당하는 멤버데이터 가져오는 메소드
    public MemberVo getMember(String id) {
        BoardDAO dao = BoardDAO.getInstance();
        Connection con = getConnection();
        dao.setConnection(con);
        MemberVo vo = dao.getMember(id); //dao호출
        close(con);
        return vo;
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

    //로그인 메소드
    public boolean loginMember(MemberVo memberVo) {
        BoardDAO dao = BoardDAO.getInstance();
        Connection con = getConnection();
        dao.setConnection(con);
        boolean isSucess = false;

        int result = dao.updateLoginState(memberVo); //dao호출
        if (result == 1) {
            commit(con);
            isSucess = true;
        } else {
            rollback(con);
        }
        close(con);
        return isSucess;
    }

    //로그아웃 메소드
    public boolean logoutMember(MemberVo memberVo) {
        BoardDAO dao = BoardDAO.getInstance();
        Connection con = getConnection();
        dao.setConnection(con);
        boolean isSucess = false;

        int result = dao.updateLoginState(memberVo);
        if (result > 0) {
            commit(con);
            isSucess = true;
        } else {
            rollback(con);
        }
        close(con);
        return isSucess;
    }

    //회원탈퇴 메소드
    public boolean deleteMember(String id) {
        //세팅
        BoardDAO dao = BoardDAO.getInstance();
        Connection con = getConnection();
        dao.setConnection(con);
        boolean isSucess = false;

        int count = dao.deleteMember(id);
        if (count > 0) {    //성공
            commit(con);
            isSucess = true;
        } else {          //실패
            rollback(con);
        }
        close(con);
        return isSucess;
    }

    //아이디 중복검사 메소드
    public int idCheck(String id) {
        BoardDAO dao = BoardDAO.getInstance();
        Connection con = getConnection();
        dao.setConnection(con);
        int count = dao.checkId(id); //dao호출
        close(con);
        return count;
    }

    //이메일 중복검사 메소드
    public int emailCheck(String email) {
        BoardDAO dao = BoardDAO.getInstance();
        Connection con = getConnection();
        dao.setConnection(con);
        int count = dao.checkEmail(email); //dao호출
        close(con);
        return count;
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

    //학원정보 글 등록할 때 선택된 지역으로 카테고리번호 찾는 메소드
    public int getCateSequence(String job) {
        BoardDAO dao = BoardDAO.getInstance();
        Connection con = getConnection();
        dao.setConnection(con);

        int sq = dao.getCateSequence(job);
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
    //글쓰기 메소드
    public boolean insertComment(CommentVo vo) {
        //세팅
        BoardDAO dao = BoardDAO.getInstance();
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
    //글삭제 메소드
    public boolean deleteComment(int num) {
        //세팅
        BoardDAO dao = BoardDAO.getInstance();
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

    //닉네임 이메일 바꾸기
    public boolean profileUpdate(MemberVo vo) {
        BoardDAO dao = BoardDAO.getInstance();
        Connection con = getConnection();
        dao.setConnection(con);
        //그냥 count넘겨도 되지만 boolean으로 함
        boolean isSucess = false;

        int count = dao.profileUpdate(vo);
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
    public ArrayList<ArticleVo> getArticleList(String query) {
        BoardDAO dao = BoardDAO.getInstance();
        Connection con = getConnection();
        dao.setConnection(con);

        ArrayList<ArticleVo> list = dao.getArticleList(query);
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
    //학원정보,자유게시판 리스트 불러오기
    public ArrayList<CommentVo> getCommentList(int num) {
        BoardDAO dao = BoardDAO.getInstance();
        Connection con = getConnection();
        dao.setConnection(con);

        ArrayList<CommentVo> list = dao.getCommentList(num);
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
