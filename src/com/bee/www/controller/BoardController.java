package com.bee.www.controller;

import com.bee.www.action.Member.*;
import com.bee.www.action.freeboard.FreeBoardAction;
import com.bee.www.action.freeboard.FreeBoardWriteAction;
import com.bee.www.action.freeboard.FreeDetailAction;
import com.bee.www.action.freeboard.FreeRegisterAction;
import com.bee.www.action.review.ReviewsAction;
import com.bee.www.action.schoolinfo.SchoolInfoAction;
import com.bee.www.action.schoolinfo.SchoolRegisterAction;
import com.bee.www.action.schoolinfo.SchoolWriteAction;
import com.bee.www.common.Action;
import com.bee.www.common.ActionForward;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("*.do")
public class BoardController extends HttpServlet {
    public BoardController() {
        super();
    }

    protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        String RequestURI = request.getRequestURI();
        String contextPath = request.getContextPath();
        String command = RequestURI.substring(contextPath.length());

        ActionForward forward = null;
        Action action = null;

        if (command.equals("/join.do")) {
            action = new MemberJoinAction();
            try {
                forward = action.execute(request, response);
            } catch (Exception e) {
                e.printStackTrace();
            }
        } else if (command.equals("/joinProc.do")) {
            action = new MemberJoinProcAction();
            try {
                forward = action.execute(request, response);
            } catch (Exception e) {
                e.printStackTrace();
            }
        } else if (command.equals("/login.do")) {
            action = new MemberLoginAction();
            try {
                forward = action.execute(request, response);
            } catch (Exception e) {
                e.printStackTrace();
            }
        } else if (command.equals("/loginProc.do")) {
            action = new MemberLoginProcAction();
            try {
                forward = action.execute(request, response);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }else if (command.equals("/logout.do")) {
            action = new MemberLogoutAction();
            try {
                forward = action.execute(request, response);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }else if(command.equals("/checkId.do")){
            action = new MemberCheckIdAction();
            try{
                forward = action.execute(request,response);
            }catch (Exception e){
                e.printStackTrace();
            }
        }else if(command.equals("/schBoard.do")){
            action = new SchoolInfoAction();
            try{
                forward = action.execute(request,response);
            }catch (Exception e){
                e.printStackTrace();
            }
        }else if(command.equals("/schBoardWrite.do")){
            action = new SchoolWriteAction();
            try{
                forward = action.execute(request,response);
            }catch (Exception e){
                e.printStackTrace();
            }
        }else if(command.equals("/schoolRegister.do")){
            action = new SchoolRegisterAction();
            try{
                forward = action.execute(request,response);
            }catch (Exception e){
                e.printStackTrace();
            }
        }else if(command.equals("/freeBoard.do")){
            action = new FreeBoardAction();
            try{
                forward = action.execute(request,response);
            }catch (Exception e){
                e.printStackTrace();
            }
        }else if(command.equals("/freeBoardWrite.do")){
            action = new FreeBoardWriteAction();
            try{
                forward = action.execute(request,response);
            }catch (Exception e){
                e.printStackTrace();
            }
        }else if(command.equals("/freeRegister.do")){
            action = new FreeRegisterAction();
            try{
                forward = action.execute(request,response);
            }catch (Exception e) {
                e.printStackTrace();
            }
        }else if(command.equals("/freeDetail.do")) {
            action = new FreeDetailAction();
            try{
                forward = action.execute(request,response);
            }catch (Exception e) {
                e.printStackTrace();
            }
        } else if(command.equals("/reviews.do")){
            action = new ReviewsAction();
            try{
                forward = action.execute(request,response);
            }catch (Exception e){
                e.printStackTrace();
            }
        }else if(command.equals("/profile.do")){
            action = new ProfileAction();
            try{
                forward = action.execute(request,response);
            }catch (Exception e){
                e.printStackTrace();
            }
        }else if(command.equals("/profileUpdate.do")){
            action = new ProfileUpdateAction();
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
