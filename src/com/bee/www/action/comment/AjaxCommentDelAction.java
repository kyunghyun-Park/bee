package com.bee.www.action.comment;

import com.bee.www.common.*;
import com.bee.www.service.BoardService;
import com.bee.www.service.CommentService;
import com.bee.www.vo.ArticleVo;
import com.bee.www.vo.CommentVo;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;

import static com.bee.www.common.RegExp.*;

public class AjaxCommentDelAction implements Action {
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

        //댓글번호 받아오기
        String commentNum = request.getParameter("commentNum");

        if ( commentNum==null || commentNum.equals("")
                || !RegExp.checkString(ARTICLE_NUM,commentNum)) {
            response.setContentType("text/html;charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println("<script>alert('잘못된 접근입니다.(1)');location.href='/';</script>");
            out.close();
            return null;
        }

        int commentNumInt = Integer.parseInt(commentNum);
        //글 번호 0보다 작으면 오류alert
        if (commentNumInt<=0) {
            response.setContentType("text/html;charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println("<script>alert('잘못된 접근입니다.(2)');history.back();</script>");
            out.close();
            return null;
        }

        CommentService service = new CommentService();
        request.setAttribute("count",service.deleteComment(commentNumInt));

        ActionForward forward = new ActionForward();
        forward.setPath("/views/ajax/AjaxCommentDel.jsp");
        return forward;
    }
}
