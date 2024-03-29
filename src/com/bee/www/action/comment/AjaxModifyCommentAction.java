package com.bee.www.action.comment;

import com.bee.www.common.Action;
import com.bee.www.common.ActionForward;
import com.bee.www.common.LoginManager;
import com.bee.www.common.RegExp;
import com.bee.www.service.CommentService;
import com.bee.www.vo.CommentVo;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;

import static com.bee.www.common.RegExp.ARTICLE_CONTENT;

public class AjaxModifyCommentAction implements Action {
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

        String num=request.getParameter("num"); //댓글 번호
        String content=request.getParameter("content"); //수정할 댓글 내용

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
        vo.setCm_sq(numInt);

        request.setAttribute("count",service.modifyComment(vo));

        ActionForward forward = new ActionForward();
        forward.setPath("/views/ajax/AjaxComment.jsp");
        return forward;
    }
}
