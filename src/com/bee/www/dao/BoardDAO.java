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
}
