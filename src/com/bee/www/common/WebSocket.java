package com.bee.www.common;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpSession;
import javax.websocket.*;
import javax.websocket.server.ServerEndpoint;

import com.bee.www.config.HttpSessionConfigurator;
import com.bee.www.vo.MemberVo;

import java.io.IOException;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

// WebSocket의 호스트 주소 설정
@ServerEndpoint(value = "/websocket", configurator = HttpSessionConfigurator.class)
public class WebSocket extends HttpServlet {
    private static Map<Session,MemberVo> users = Collections.synchronizedMap(new HashMap<Session, MemberVo>());
    private Map<Session, EndpointConfig> configs = Collections.synchronizedMap(new HashMap<>());

    LoginManager lm = LoginManager.getInstance();

    // WebSocket으로 브라우저가 접속하면 요청되는 함수
    @OnOpen
    public void onOpen(Session session, EndpointConfig config){
        String id = lm.getMemberId((HttpSession) config.getUserProperties().get(HttpSession.class.getName()));

        MemberVo client = new MemberVo();
        System.out.println(session);
        client.setId(id);

        users.put(session, client);
        if(id!=null) {
            sendNotice(id + "님이 입장하셨습니다.");
        }
    }
    public void sendNotice(String message){
        String userName = "server";

        synchronized (users) {
            Iterator<Session> it = users.keySet().iterator();
            while(it.hasNext()){
                Session currentSession = it.next();
                try {
                    currentSession.getBasicRemote().sendText(userName + " : " + message);
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }

    // WebSocket으로 메시지가 오면 요청되는 함수
    @OnMessage
    public void onMsg(String message, Session session) throws IOException{
        String userName = users.get(session).getId();
        System.out.println(userName + " : " + message);

        synchronized (users) {
            Iterator<Session> it = users.keySet().iterator();
            while(it.hasNext()){
                Session currentSession = it.next();
                if(!currentSession.equals(session)){
                    currentSession.getBasicRemote().sendText(userName + " : " + message);
                }
            }
        }
    }

    // WebSocket과 브라우저가 접속이 끊기면 요청되는 함수
    @OnClose
    public void onClose(Session session) {
        String userName = users.get(session).getId();
        users.remove(session);
        if(userName!=null){
            sendNotice(userName + "님이 퇴장하셨습니다");
        }
    }

    // WebSocket과 브라우저 간에 통신 에러가 발생하면 요청되는 함수.
    @OnError
    public void handleError(Throwable t) {
// 콘솔에 에러를 표시한다.
        t.printStackTrace();
    }
}
