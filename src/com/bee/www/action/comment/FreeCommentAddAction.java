package com.bee.www.action.comment;

import com.bee.www.common.*;
import com.bee.www.service.BoardService;
import com.bee.www.service.CommentService;
import com.bee.www.vo.ArticleVo;
import com.bee.www.vo.CommentVo;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;

import static com.bee.www.common.RegExp.ARTICLE_CONTENT;
import static com.bee.www.common.RegExp.ARTICLE_TITLE;

public class FreeCommentAddAction implements Action {
    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        LoginManager lm = LoginManager.getInstance();
        String id = lm.getMemberId(request.getSession());
        //로그인 안돼있을때
        if (id == null) {
            response.setContentType("text/html;charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println("<script>alert('로그인이 필요한 서비스 입니다.');location.href='/login.do';</script>");
            out.close();
            return null;
        }

        //댓글내용 받아오기
        String content = request.getParameter("content");
        String num = request.getParameter("num");

        //글 번호 유효성검사,RegExp = 글 번호 유효성 검사
        if (content == null || content.equals("")
                || !RegExp.checkString(ARTICLE_CONTENT, content)) {
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

        CommentService service = new CommentService();
        //vo에 담음
        CommentVo vo = new CommentVo();
        vo.setContent(content);
        vo.setM_sq(service.getMemberSequence(id));
        vo.setB_sq(numInt);

        if(service.insertComment(vo)<=0){
            response.setContentType("text/html;charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println("<script>alert('댓글 저장에 실패했습니다.');history.back();</script>");
            out.close();
            return null;
        }

        ActionForward forward = new ActionForward();
        forward.setPath("/freeDetail.do?num="+numInt);
        forward.setRedirect(true);
        return forward;
    }


}
