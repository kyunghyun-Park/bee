package com.bee.www.action.schoolinfo;

import com.bee.www.common.Action;
import com.bee.www.common.ActionForward;
import com.bee.www.common.Parser;
import com.bee.www.common.RegExp;
import com.bee.www.service.BoardService;
import com.bee.www.service.CommentService;
import com.bee.www.vo.ArticleVo;
import com.bee.www.vo.CommentVo;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;
import java.util.ArrayList;

import static com.bee.www.common.RegExp.ARTICLE_NUM;

public class SchoolDetailAction implements Action {
    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String num = request.getParameter("num");

        //글 번호 유효성검사,RegExp = 글 번호 유효성 검사
        if (num == null || num.equals("") || !RegExp.checkString(ARTICLE_NUM, num)) {
            response.setContentType("text/html;charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println("<script>alert('잘못된 접근입니다.');history.back();</script>");
            out.close();
            return null;
        }

        int numInt = Integer.parseInt(num);  //유효성 검사 후 글 번호 숫자로 변환
        //글 번호 0보다 작으면 오류alert
        if (numInt <= 0) {
            response.setContentType("text/html;charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println("<script>alert('잘못된 접근입니다.');history.back();</script>");
            out.close();
            return null;
        }
        BoardService service = new BoardService();
        CommentService commentService=  new CommentService();
        ArticleVo vo = service.getArticleDetail(numInt);    //detail service 호출
        vo.setCate_name(service.getCateName(vo.getC_sq()));
        vo.setComment_count(commentService.getCommentCount(numInt));  //댓글 수 vo에 담음

        if (vo == null) {
            response.setContentType("text/html;charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println("<script>alert('잘못된 접근입니다.');history.back();</script>");
            out.close();
            return null;
        }
        //댓글 목록 불러오기
        ArrayList<CommentVo> commentList=commentService.getCommentList(numInt);
        request.setAttribute("comment",commentList);

        //----------------------------------------쿠키로 조회수 중복방지
        Cookie viewCookie = null;
        Cookie[] cookies = request.getCookies();
        System.out.println("쿠키 이름" + cookies);

        if (cookies != null) {
            for (int i = 0; i < cookies.length; i++) {
//                System.out.println("쿠키 이름: " + cookies[i].getName());
                //만들어진 쿠키들을 확인,만약 들어온 적 있다면 생성됐을 쿠키가 있는지 화긴
                if (cookies[i].getName().equals("|" + numInt + "|")) {
//                    System.out.println("if문 쿠키 이름:" + cookies[i].getName());
                    //찾은 쿠키를 변수에 저장
                    viewCookie = cookies[i];
                }
            }
        } else {
//            System.out.println("cookie 확인 로직:쿠키가 없습니다.");
        }

        //만들어진 쿠키 없음을 확인
        if(viewCookie==null){
//            System.out.println("쿠키없당");
            try{
                //이 페이지에 왔다는 증거 쿠키 생성
                Cookie newCookie =  new Cookie("|"+numInt+"|","readCount");
                newCookie.setMaxAge(1*24*60*60);    //하루저장
                response.addCookie(newCookie);  //쿠키 추가

                //쿠키가 없으니 조회수 증가
                if(service.updateHitCount(numInt)){
                    System.out.println("조회수 증가");
                }else{
                    System.out.println("조회수 증가 에러");
                }

            }catch (Exception e){
                System.out.println("쿠키 넣을때 오류남");
                e.printStackTrace();
            }
        }else{  //만들어진 쿠키 있을때 증가로직 진행X
//            System.out.println("쿠키 있음 값:"+viewCookie.getValue());
        }
        vo.setContent(Parser.chgToHTML(vo.getContent()));

        ActionForward forward = new ActionForward();
        request.setAttribute("vo", vo);
        forward.setPath("/views/schoolInfo-detail.jsp");
        return forward;
    }
}