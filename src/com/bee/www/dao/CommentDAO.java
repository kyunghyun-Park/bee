package com.bee.www.dao;

import com.bee.www.vo.ArticleVo;
import com.bee.www.vo.CommentVo;
import com.bee.www.vo.MemberVo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import static com.bee.www.common.JdbcUtil.close;

public class CommentDAO {
    private Connection con;

    //싱글턴 패턴 기본생성자를 private로 생성 불가능하게 함
    private CommentDAO() {

    }

    //getInstance를 통해서만 생성 가능하게 함
    public static CommentDAO getInstance() {
        return LazyHolder.INSTANCE;
    }

    //LazyHolder.INSTANCE를 참조하는 순간 Class가 로딩되며 초기화 진행
    private static class LazyHolder {
        private static final CommentDAO INSTANCE = new CommentDAO();
    }

    public void setConnection(Connection con) {
        this.con = con;
    }
   //댓글 등록
       public int insertComment(CommentVo vo){
           PreparedStatement pstmt = null;
           int count = 0;
           try{
               //현재 로그인된 id에 해당하는 고유번호 조회
               pstmt = con.prepareStatement("insert into comment(m_sq, b_sq, content) value(?, ?, ?)");
               pstmt.setInt(1,vo.getM_sq());
               pstmt.setInt(2,vo.getB_sq());
               pstmt.setString(3,vo.getContent());
               count=pstmt.executeUpdate();
           }catch (Exception e){
               e.printStackTrace();
           }finally {
               close(pstmt);
           }
           return count;
       }

    //댓글 목록
    public ArrayList<CommentVo> getCommentList(int num) {
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        ArrayList<CommentVo> list = new ArrayList<>();

        try{
            pstmt = con.prepareStatement("select cm.cm_sq, m.nickname, cm.content, cm.writeDate,m.id,m.image " +
                                                "from comment cm " +
                                                "inner join member m on cm.m_sq = m.sq " +
                                                "where b_sq=? "+
                                                "order by cm_sq");
            pstmt.setInt(1,num);
            rs=pstmt.executeQuery();
            while(rs.next()){
                CommentVo vo = new CommentVo();
                vo.setCm_sq(rs.getInt("cm_sq"));
                vo.setId(rs.getString("id"));   //댓글 삭제를 위해 가져옴
                vo.setNickname(rs.getString("nickname"));
                vo.setContent(rs.getString("content"));
                vo.setB_sq(num);
                vo.setWriteDate(rs.getString("writeDate"));
                vo.setNewFileName(rs.getString("image"));
                list.add(vo);
            }
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            close(rs);
            close(pstmt);
        }
        return list;
    }

    //댓글 삭제
    public int deleteComment(int num){
        PreparedStatement pstmt = null;
        int count = 0;
        try{
            //현재 로그인된 id에 해당하는 고유번호 조회
            pstmt = con.prepareStatement("delete from comment where cm_sq=?");
            pstmt.setInt(1,num);
            count=pstmt.executeUpdate();
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            close(pstmt);
        }
        return count;
    }
    //아이디 중복검사
    public int getCommentCount(int num){
        PreparedStatement pstmt=null;
        ResultSet rs = null;
        int count=0;

        try{
            pstmt=con.prepareStatement("select count(*) from comment where b_sq=?");
            pstmt.setInt(1,num);
            rs=pstmt.executeQuery();
            while(rs.next()){
                count=rs.getInt(1); //0이면 미중복
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
