package com.bee.www.dao;

import com.bee.www.vo.MemberVo;
import java.sql.ResultSet;
import java.sql.Connection;
import java.sql.PreparedStatement;
import static com.bee.www.common.JdbcUtil.close;

public class BoardDAO {
    private Connection con;

    //싱글턴 패턴 기본생성자를 private로 생성 불가능하게 함
    private BoardDAO() {

    }

    //getInstance를 통해서만 생성 가능하게 함
    public static BoardDAO getInstance() {
        return LazyHolder.INSTANCE;
    }

    //LazyHolder.INSTANCE를 참조하는 순간 Class가 로딩되며 초기화 진행
    private static class LazyHolder {
        private static final BoardDAO INSTANCE = new BoardDAO();
    }

    public void setConnection(Connection con) {
        this.con = con;
    }

    //회원가입
    public int insertMember(MemberVo vo) {
        PreparedStatement pstmt = null;
        int count = 0;
        try {
            pstmt = con.prepareStatement("insert into member(id,pwd,nickname,email) value (?,?,?,?)");
            pstmt.setString(1,vo.getId());
            pstmt.setString(2,vo.getPwd());
            pstmt.setString(3,vo.getNickname());
            pstmt.setString(4,vo.getEmail());
            count = pstmt.executeUpdate();
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            close(pstmt);
        }
        return count;
    }
    //로그인할 때 입력한 아이디에 해당하는 비번 갖고오기
    public MemberVo getMember(String id){
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        MemberVo vo = null;

        try{
            pstmt=con.prepareStatement("select mem_sq,id,pwd from member where binary(id)=?");
            pstmt.setString(1,id);
            rs=pstmt.executeQuery();
            while (rs.next()){
                vo=new MemberVo();
                vo.setMem_sq(rs.getInt("mem_sq"));
                vo.setId(rs.getString("id"));
                vo.setPwd(rs.getString("pwd"));
            }
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            close(rs);
            close(pstmt);
        }
        return vo;
    }

    //getMember메소드에서 받은 mem_sq번호로 로그인상태로 변경
    public int updateLoginState(MemberVo vo){
        PreparedStatement pstmt=null;
        int count=0;
        try{
            pstmt = con.prepareStatement("update member set lgn_fl=? where mem_sq=?");
            pstmt.setBoolean(1,vo.isLgn_fl());
            pstmt.setInt(2,vo.getMem_sq());
            count=pstmt.executeUpdate();
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            close(pstmt);
        }
        return count;
    }

    //아이디 중복검사
    public int checkId(String id){
        PreparedStatement pstmt=null;
        ResultSet rs = null;
        int count=0;

        try{
            pstmt=con.prepareStatement("select count(id) as cnt from member where id=?");
            pstmt.setString(1,id);
            rs=pstmt.executeQuery();
            while(rs.next()){
                count=rs.getInt("cnt");
            }
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            close(rs);
            close(pstmt);
        }
        return count;
    }
}
