package com.bee.www.common;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;


public class MailAuthentication extends Authenticator {
    PasswordAuthentication passAuth;
    public MailAuthentication() {
        passAuth = new PasswordAuthentication("qqqq_o@naver.com", "!!!qoa7848");
    }

    public PasswordAuthentication getPasswordAuthentication() {
        return passAuth;
    }
}
