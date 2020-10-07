package com.bee.www.action.freeboard;

import com.bee.www.common.Action;
import com.bee.www.common.ActionForward;
import com.bee.www.common.RegExp;
import com.bee.www.service.BoardService;
import com.bee.www.vo.ArticleVo;

import static com.bee.www.common.RegExp.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;

public class FreeDetailAction implements Action {
    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String num=request.getParameter("num");

        //글 번호 유효성검사,RegExp = 글 번호 유효성 검사
        if (num == null||num.equals("")|| !RegExp.checkString(ARTICLE_NUM,num)) {
            response.setContentType("text/html;charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println("<script>alert('잘못된 접근입니다.');history.back();</script>");
            out.close();
            return null;
        }

        int numInt = Integer.parseInt(num);  //유효성 검사 후 글 번호 숫자로 변환
        //글 번호 0보다 작으면 오류alert
        if(numInt<=0){
            response.setContentType("text/html;charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println("<script>alert('잘못된 접근입니다.');history.back();</script>");
            out.close();
            return null;
        }
        BoardService service = new BoardService();
        ArticleVo vo = service.getArticleDetail(numInt);    //detail service 호출
        if(vo==null){
            response.setContentType("text/html;charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println("<script>alert('잘못된 접근입니다.');history.back();</script>");
            out.close();
            return null;
        }
        
        ActionForward forward = new ActionForward();
        request.setAttribute("vo", vo);
        forward.setPath("/views/freeBoard-detail.jsp");

        return forward;
    }
}