package com.bee.www.dao;

import com.bee.www.common.Pagenation;
import com.bee.www.vo.ArticleVo;
import com.bee.www.vo.CommentVo;
import com.bee.www.vo.MemberVo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

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

    //총 게시글 수 가져오기
    public int getArticleCount(String query){
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        int count =0;
        try{
            pstmt=con.prepareStatement(
                    "select count(*) from board where "+query);
            rs=pstmt.executeQuery();
            while (rs.next()){
                count=rs.getInt(1);
            }
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            close(rs);
            close(pstmt);
        }
        return count;
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
            pstmt=con.prepareStatement("select sq,id,pwd,nickname,email from member where binary(id)=?");
            pstmt.setString(1,id);
            rs=pstmt.executeQuery();
            while (rs.next()){
                vo=new MemberVo();
                vo.setMem_sq(rs.getInt("sq"));
                vo.setId(rs.getString("id"));
                vo.setPwd(rs.getString("pwd"));
                vo.setNickname(rs.getString("nickname"));
                vo.setEmail(rs.getString("email"));
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
            pstmt = con.prepareStatement("update member set lgn_fl=? where sq=?");
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

    //글 수정,삭제할 때 작성자 id가져오기
    public String getWriterId(int num){
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String id = null;

        try {
            pstmt=con.prepareStatement("select m.id " +
                                            "from board b " +
                                            "inner join member m on b.m_sq = m.sq " +
                                            "where b_sq=?");
            pstmt.setInt(1,num);
            rs=pstmt.executeQuery();
            while(rs.next()){
                id=rs.getString("id");
            }
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            close(rs);
            close(pstmt);
        }
        return id;
    }
    public String getCateName(int c_sq){
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String cate_name = null;

        try {
            pstmt=con.prepareStatement("select cate_name from category where cate_num=?");
            pstmt.setInt(1,c_sq);
            rs=pstmt.executeQuery();
            while(rs.next()){
                cate_name=rs.getString("cate_name");
            }
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            close(rs);
            close(pstmt);
        }
        return cate_name;
    }
    //아이디 중복검사
    public int checkId(String id){
        PreparedStatement pstmt=null;
        ResultSet rs = null;
        int count=0;

        try{
            pstmt=con.prepareStatement("select count(id) as cnt from member where binary(id)=?");
            pstmt.setString(1,id);
            rs=pstmt.executeQuery();
            while(rs.next()){
                count=rs.getInt("cnt"); //0이면 미중복
            }
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            close(rs);
            close(pstmt);
        }
        return count;
    }

    //이메일 중복검사
    public int checkEmail(String email){
        PreparedStatement pstmt=null;
        ResultSet rs = null;
        int count=0;

        try{
            pstmt=con.prepareStatement("select count(*) from member where binary(email)=?");
            pstmt.setString(1,email);
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

    //로그인 된 유저 시퀀스 조회
    public int getMemberSequence(String id){
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        int sq = 0;
        try{
            //현재 로그인된 id에 해당하는 고유번호 조회
            pstmt = con.prepareStatement("select sq from member where id=?");
            pstmt.setString(1,id);
            rs = pstmt.executeQuery();
            while (rs.next()){
                sq=rs.getInt("sq");
            }
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            close(rs);
            close(pstmt);
        }
        return sq;
    }

    //회원 탈퇴
    public int deleteMember(String id){
        PreparedStatement pstmt = null;
        int count = 0;
        try{
            //현재 로그인된 id에 해당하는 고유번호 조회
            pstmt = con.prepareStatement("delete from member where id=?");
            pstmt.setString(1,id);
            count=pstmt.executeUpdate();
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            close(pstmt);
        }
        return count;
    }

    //글 목록 띄우기
    public ArrayList<ArticleVo> getArticleList(Pagenation pagenation, String query) {
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        ArrayList<ArticleVo> list = new ArrayList<>();

        try{
            pstmt = con.prepareStatement("select b.b_sq, m.nickname, " +
                    "b.title,b.content," +
                    "b.hit,b.writeDate, b.c_sq " +
                    "from board b inner join member m on b.m_sq = m.sq where "+query
                    +" order by b_sq desc" +
                    " limit ?, ?");
            //limit (1,가져올 글 개수)
            pstmt.setInt(1,pagenation.getStartArticleNumber());
            pstmt.setInt(2,pagenation.getSHOW_ARTICLE_COUNT());
            rs=pstmt.executeQuery();
            while(rs.next()){
                ArticleVo vo = new ArticleVo();
                vo.setB_sq(rs.getInt("b_sq"));
                vo.setC_sq(rs.getInt("c_sq"));
                vo.setNickname(rs.getString("nickname"));
                vo.setTitle(rs.getString("title"));
                vo.setContent(rs.getString("content"));
                vo.setHit(rs.getInt("hit"));
                vo.setWriteDate(rs.getString("writeDate"));
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
    //리뷰 띄우기
    public ArrayList<ArticleVo> getReviewsList() {
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        ArrayList<ArticleVo> list = new ArrayList<>();

        try{
            pstmt = con.prepareStatement("select r.b_sq, m.nickname, r.content, r.writeDate " +
                                                "from board_review r " +
                                                "inner join member m on r.m_sq = m.sq " +
                                                "order by r.b_sq desc");
            rs=pstmt.executeQuery();
            while(rs.next()){
                ArticleVo vo = new ArticleVo();
                vo.setNickname(rs.getString("nickname"));
                vo.setContent(rs.getString("content"));
                vo.setWriteDate(rs.getString("writeDate"));
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

    //글 등록
    public int insertArticle(ArticleVo vo){
        PreparedStatement pstmt = null;
        int count = 0;
        try{
            //현재 로그인된 id에 해당하는 고유번호 조회
            pstmt = con.prepareStatement("insert into board(m_sq, c_sq, title, content) value(?, ?, ?, ?)");
            pstmt.setInt(1,vo.getM_sq());
            pstmt.setInt(2,vo.getC_sq());
            pstmt.setString(3,vo.getTitle());
            pstmt.setString(4,vo.getContent());
            count=pstmt.executeUpdate();
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            close(pstmt);
        }
        return count;
    }
    //글 수정
    public int updateArticle(ArticleVo vo){
        PreparedStatement pstmt = null;
        int count = 0;
        try{
            //현재 로그인된 id에 해당하는 고유번호 조회
            pstmt = con.prepareStatement("update board set c_sq=?, title=?, content=? where b_sq=?");
            pstmt.setInt(1,vo.getC_sq());
            pstmt.setString(2,vo.getTitle());
            pstmt.setString(3,vo.getContent());
            pstmt.setInt(4,vo.getB_sq());
            count=pstmt.executeUpdate();
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            close(pstmt);
        }
        return count;
    }
    //글 삭제
    public int deleteArticle(int num){
        PreparedStatement pstmt = null;
        int count = 0;
        try{
            //현재 로그인된 id에 해당하는 고유번호 조회
            pstmt = con.prepareStatement("delete from board where b_sq=?");
            pstmt.setInt(1,num);
            count=pstmt.executeUpdate();
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            close(pstmt);
        }
        return count;
    }
    //리뷰 등록
    public int insertReviews(ArticleVo vo){
        PreparedStatement pstmt = null;
        int count = 0;
        try{
            //현재 로그인된 id에 해당하는 고유번호 조회
            pstmt = con.prepareStatement("insert into board_review(m_sq, content) value(?, ?)");
            pstmt.setInt(1,vo.getM_sq());
            pstmt.setString(2,vo.getContent());
            count=pstmt.executeUpdate();
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            close(pstmt);
        }
        return count;
    }
    //리뷰 등록
    public int profileUpdate(MemberVo vo){
        PreparedStatement pstmt = null;
        int count = 0;
        try{
            //현재 로그인된 id에 해당하는 고유번호 조회
            pstmt = con.prepareStatement("update member set nickname=?,email=? where id=?");
            pstmt.setString(1,vo.getNickname());
            pstmt.setString(2,vo.getEmail());
            pstmt.setString(3,vo.getId());
            count=pstmt.executeUpdate();
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            close(pstmt);
        }
        return count;
    }

    //글 내용보기
    public ArticleVo getArticleDetail(int num){
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        ArticleVo vo = null;
        //데이터 담기
        try{
            //현재 로그인된 id에 해당하는 고유번호 조회
            pstmt = con.prepareStatement("select b.b_sq, b.m_sq, m.id, " +
                                                "b.title, b.content, b.c_sq, " +
                                                "b.hit, b.writeDate, m.nickname " +
                                                "from board b inner join member m on b.m_sq = m.sq " +
                                                "where b_sq=? ");
            pstmt.setInt(1,num);
            rs=pstmt.executeQuery();
            while(rs.next()){
                vo = new ArticleVo();   //글 조회 돼야 인스턴스 생성
                vo.setB_sq(rs.getInt("b_sq"));
                vo.setId(rs.getString("id"));
                vo.setC_sq(rs.getInt("c_sq"));
                vo.setTitle(rs.getString("title"));
                vo.setContent(rs.getString("content"));
                vo.setHit(rs.getInt("hit"));
                vo.setWriteDate(rs.getString("writeDate"));
                vo.setNickname(rs.getString("nickname"));
            }
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            close(rs);
            close(pstmt);
        }
        return vo;
    }

    //조회수 증가
    public int updateHitCount(int num){
        PreparedStatement pstmt=null;
        int count= 0;
        try{
            pstmt=con.prepareStatement("update board set hit=hit+1 where b_sq=?");
            pstmt.setInt(1,num);
            count=pstmt.executeUpdate();
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            close(pstmt);
        }
        return count;
    }
}
