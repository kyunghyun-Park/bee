package com.bee.www.action.ajax;

import com.bee.www.common.Action;
import com.bee.www.common.ActionForward;
import com.bee.www.common.LoginManager;
import com.bee.www.service.BoardService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class BoardRecCountAction implements Action {
    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        LoginManager lm = LoginManager.getInstance();
        String id = lm.getMemberId(request.getSession());

        int num = Integer.parseInt(request.getParameter("num"));

        //service
        BoardService service = new BoardService();
        int count = service.recCount(num);  // 게시글 총 추천수를 구함
        request.setAttribute("count", count);   //총 추천수 전달

        if(service.recCheck(num, id)){
            request.setAttribute("onOff", 0);//아직 추천하지 않았을때 0전달
        }else{
            request.setAttribute("onOff", 1);//추천되있을때는 1전달
        }

        ActionForward forward = new ActionForward();
        forward.setPath("/views/ajax/AjaxCheckRec.jsp");
        return forward;
    }
}
