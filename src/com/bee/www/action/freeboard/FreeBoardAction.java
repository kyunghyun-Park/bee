package com.bee.www.action.freeboard;

import com.bee.www.common.Action;
import com.bee.www.common.ActionForward;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class FreeBoardAction implements Action {
    @Override
    public ActionForward execute
            (HttpServletRequest request, HttpServletResponse response) {
        ActionForward forward = new ActionForward();
        forward.setPath("/views/freeBoard.jsp");
        return forward;
    }
}
