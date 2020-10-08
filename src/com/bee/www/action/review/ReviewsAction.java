package com.bee.www.action.review;

import com.bee.www.common.Action;
import com.bee.www.common.ActionForward;
import com.bee.www.service.BoardService;
import com.bee.www.vo.ArticleVo;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;

public class ReviewsAction implements Action {
    @Override
    public ActionForward execute
            (HttpServletRequest request, HttpServletResponse response) {
        BoardService service = new BoardService();

        ArrayList<ArticleVo> ReviewsList = service.getReviewsList();
        request.setAttribute("list",ReviewsList);

        ActionForward forward = new ActionForward();
        forward.setPath("/views/reviews.jsp");
        return forward;
    }
}
