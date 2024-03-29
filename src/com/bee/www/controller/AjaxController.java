package com.bee.www.controller;

import com.bee.www.action.Member.*;
import com.bee.www.action.comment.AjaxAddCommentAction;
import com.bee.www.action.comment.AjaxDelCommentAction;
import com.bee.www.action.ajax.BoardRecCountAction;
import com.bee.www.action.ajax.BoardRecUpdateAction;
import com.bee.www.action.comment.AjaxModifyCommentAction;
import com.bee.www.common.Action;
import com.bee.www.common.ActionForward;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("*.ajax")
public class AjaxController extends HttpServlet {
    public AjaxController() {
        super();
    }

    protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        String RequestURI = request.getRequestURI();
        String contextPath = request.getContextPath();
        String command = RequestURI.substring(contextPath.length());

        ActionForward forward = null;
        Action action = null;

        if (command.equals("/checkId.ajax")) {
            action = new AjaxCheckIdAction();
            try{
                forward = action.execute(request,response);
            }catch (Exception e){
                e.printStackTrace();
            }
        }else if (command.equals("/checkEmail.ajax")) {
            action = new AjaxCheckEmailAction();
            try{
                forward = action.execute(request,response);
            }catch (Exception e){
                e.printStackTrace();
            }
        }else if (command.equals("/delComment.ajax")) {
            action = new AjaxDelCommentAction();
            try{
                forward = action.execute(request,response);
            }catch (Exception e){
                e.printStackTrace();
            }
        }else if (command.equals("/addComment.ajax")) {
            action = new AjaxAddCommentAction();
            try{
                forward = action.execute(request,response);
            }catch (Exception e){
                e.printStackTrace();
            }
        }else if (command.equals("/modifyComment.ajax")) {
            action = new AjaxModifyCommentAction();
            try {
                forward = action.execute(request, response);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }else if (command.equals("/recUpdate.ajax")) {
            action = new BoardRecUpdateAction();
            try{
                forward = action.execute(request,response);
            }catch (Exception e){
                e.printStackTrace();
            }
        }else if (command.equals("/recCount.ajax")) {
            action = new BoardRecCountAction();
            try{
                forward = action.execute(request,response);
            }catch (Exception e){
                e.printStackTrace();
            }
        }


        if (forward != null) {
            if (forward.isRedirect()) {
                response.sendRedirect(forward.getPath());
            } else {
                RequestDispatcher dispatcher
                        = request.getRequestDispatcher(forward.getPath());
                dispatcher.forward(request, response);
            }
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doProcess(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doProcess(request, response);
    }
}
