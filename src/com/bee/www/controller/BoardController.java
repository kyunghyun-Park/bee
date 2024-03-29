package com.bee.www.controller;

import com.bee.www.action.Member.*;
import com.bee.www.action.freeboard.*;
import com.bee.www.action.review.ReviewsAction;
import com.bee.www.action.review.ReviewsRegisterAction;
import com.bee.www.action.schoolinfo.*;
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
        }else if (command.equals("/deleteMember.do")) {
            action = new MemberDeleteAction();
            try {
                forward = action.execute(request, response);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        else if(command.equals("/schBoard.do")){
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
        }else if(command.equals("/schDetail.do")){
            action = new SchoolDetailAction();
            try{
                forward = action.execute(request,response);
            }catch (Exception e){
                e.printStackTrace();
            }
        }else if(command.equals("/schUpdate.do")){
            action = new SchoolUpdateAction();
            try{
                forward = action.execute(request,response);
            }catch (Exception e){
                e.printStackTrace();
            }
        }else if(command.equals("/schUpdateProc.do")){
            action = new SchoolUpdateProcAction();
            try{
                forward = action.execute(request,response);
            }catch (Exception e){
                e.printStackTrace();
            }
        }else if(command.equals("/schDelete.do")){
            action = new SchoolDeleteAction();
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
        }else if(command.equals("/freeUpdate.do")){
            action = new FreeUpdateAction();
            try{
                forward = action.execute(request,response);
            }catch (Exception e){
                e.printStackTrace();
            }
        }else if(command.equals("/freeUpdateProc.do")){
            action = new FreeUpdateProcAction();
            try{
                forward = action.execute(request,response);
            }catch (Exception e){
                e.printStackTrace();
            }
        }else if(command.equals("/freeDelete.do")){
            action = new FreeDeleteAction();
            try{
                forward = action.execute(request,response);
            }catch (Exception e){
                e.printStackTrace();
            }
        }else if(command.equals("/reviews.do")){
            action = new ReviewsAction();
            try{
                forward = action.execute(request,response);
            }catch (Exception e){
                e.printStackTrace();
            }
        } else if(command.equals("/reviewsRegister.do")){
            action = new ReviewsRegisterAction();
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
        }else if(command.equals("/profileImgUpdate.do")){
            action = new ProfileImgUpdateAction();
            try{
                forward = action.execute(request,response);
            }catch (Exception e){
                e.printStackTrace();
            }
        }else if(command.equals("/profilePasswd.do")){
            action = new ProfileChangePwdAction();
            try{
                forward = action.execute(request,response);
            }catch (Exception e){
                e.printStackTrace();
            }
        }else if (command.equals("/profilePasswdProc.do")) {
            action = new ProfileChangePwdProcAction();
            try{
                forward = action.execute(request,response);
            }catch (Exception e){
                e.printStackTrace();
            }
        }else if (command.equals("/findPwd.do")) {
            action = new FindPwdAction();
            try{
                forward = action.execute(request,response);
            }catch (Exception e){
                e.printStackTrace();
            }
        }


        if (forward != null) {
            if (forward.isRedirect()) { //isRedirect가 true일 때(정보 처리) sendRedirect로 이동
                response.sendRedirect(forward.getPath());
            } else {                    //isRedirect가 false일 때(화면 이동) forward로 이동
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
