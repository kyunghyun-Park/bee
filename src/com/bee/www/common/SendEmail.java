package com.bee.www.common;


import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Properties;

public class SendEmail {
    public String sender = "Gookbee";
    public String mailHost = "smtp.naver.com";
    public int mailPort = 465;
    private String title;       //메일 제목
    private String contents;    //메일 내용
    boolean isSuccess = true;

  /*  public void setSEDB(String cateory) throws Exception {
        ParsingUtil pu = new ParsingUtil();
        this.cateory = cateory;
        AdminProService adminProService = new AdminProService();
        emailBean = adminProService.getEmailInfoByCategory(cateory);
        if (emailBean == null) {
            isSuccess = false;
            System.out.println("관리자 페이지에 등록된 메일 발신 정보가 없습니다.");
        } else {
            title = pu.chgToHTML(emailBean.getSM_TITLE());
            contents = pu.chgToHTML(emailBean.getSM_CONTENTS());
            sender = emailBean.getSM_SEND_EMAIL();
        }

    }*/

    public boolean getIsSuccess() {
        return isSuccess;
    }

    //메일 보내기 기능일때
    public void setEmailMsg(String title, String contents, String sender) {
        this.title = title;
        this.contents = contents;
        this.sender = sender;
    }

    public void setSendEmail(String receiver) {
        try {
            Properties props = new Properties();
            props.put("mail.transport.protocol", "smtp");
            props.put("mail.smtp.host", mailHost);
            props.put("mail.smtp.port", mailPort);
            props.put("mail.smtp.auth", "true");
            Authenticator auth = new MailAuthentication();
            Session s = Session.getDefaultInstance(props, auth);
            Message message = new MimeMessage(s);
            Address sender_address = new InternetAddress(sender);       //보내는사람 이메일
            Address receiver_address = new InternetAddress(receiver);  //받는사람 이메일
            message.setHeader("content-type", "text/html;charset=UTF-8");
            message.setFrom(sender_address);
            message.addRecipient(Message.RecipientType.TO, receiver_address);
            message.setSubject(title);
            message.setContent(contents, "text/html;charset=UTF-8");
            message.setSentDate(new java.util.Date());
            Transport.send(message); //전송
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("메일 전송에 실패하였습니다.");
        }
    }

/*    public void UpdateSMH(String adminid, String email, String category) throws Exception {
        SMHBean smhBean = new SMHBean();
        smhBean.setSMH_TITLE(title);
        smhBean.setSMH_CONTENT(contents);
        smhBean.setSMH_SEND_EMAIL(sender);
        smhBean.setSMH_SEND_ADMIN_ID(adminid);
        smhBean.setSMH_RECEIVE_EMAIL(email);
        smhBean.setSMH_CATEGORY(category);
        smhBean.setSMH_SEND_YMD(new SimpleDateFormat("yyyy-MM-dd HH:mm").format(new Date()));
        AdminProService adminProService = new AdminProService();
        boolean isSuccess = adminProService.regSMH(smhBean);
        if (!isSuccess) {
            System.out.println("메일 히스토리 저장에 실패하였습니다. ");
        }
    }*/
}

