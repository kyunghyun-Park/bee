package com.bee.www.config;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import javax.websocket.HandshakeResponse;
import javax.websocket.server.HandshakeRequest;
import javax.websocket.server.ServerEndpointConfig;

public class HttpSessionConfigurator extends ServerEndpointConfig.Configurator {

    @Override
    public void modifyHandshake(ServerEndpointConfig config, HandshakeRequest request, HandshakeResponse response) {
        //httpRequest로부터 session 받는다
        HttpSession session = (HttpSession) request.getHttpSession();
        //httpSession으로부터 context도 받는다
        ServletContext ctx = session.getServletContext();
        config.getUserProperties().put(HttpSession.class.getName(), session);
        config.getUserProperties().put(ServletContext.class.getName(), ctx);
    }
}
