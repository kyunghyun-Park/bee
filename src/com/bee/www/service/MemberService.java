package com.bee.www.service;

import com.bee.www.dao.MemberDAO;
import com.bee.www.vo.MemberVo;

import java.sql.Connection;

import static com.bee.www.common.JdbcUtil.*;

public class MemberService {
    public boolean changePwd(MemberVo vo){
        MemberDAO dao=MemberDAO.getInstance();
        Connection con=getConnection();
        dao.setConnection(con);
        boolean isSucess=false;
        int count=dao.changePwd(vo);
        if(count>0){
            commit(con);
            isSucess=true;
        }else{
            rollback(con);
        }
        close(con);
        return isSucess;
    }
    //회원가입 메소드
    public boolean joinMember(MemberVo memberVo) {
        MemberDAO dao = MemberDAO.getInstance();
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
        MemberDAO dao = MemberDAO.getInstance();
        Connection con = getConnection();
        dao.setConnection(con);
        MemberVo vo = dao.getMember(id); //dao호출
        close(con);
        return vo;
    }

    //로그인 메소드
    public boolean loginMember(MemberVo memberVo) {
        MemberDAO dao = MemberDAO.getInstance();
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
        MemberDAO dao = MemberDAO.getInstance();
        Connection con = getConnection();
        dao.setConnection(con);
        boolean isSucess = false;
        memberVo.setMem_sq(dao.getMemberSequence(memberVo.getId()));
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
        MemberDAO dao = MemberDAO.getInstance();
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
        MemberDAO dao = MemberDAO.getInstance();
        Connection con = getConnection();
        dao.setConnection(con);
        int count = dao.checkId(id); //dao호출
        close(con);
        return count;
    }

    //이메일 중복검사 메소드
    public int emailCheck(String email) {
        MemberDAO dao = MemberDAO.getInstance();
        Connection con = getConnection();
        dao.setConnection(con);
        int count = dao.checkEmail(email); //dao호출
        close(con);
        return count;
    }

    //닉네임 이메일 바꾸기
    public boolean profileUpdate(MemberVo vo) {
        MemberDAO dao = MemberDAO.getInstance();
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
}
