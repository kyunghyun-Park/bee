package com.bee.www.vo;

public class CommentVo {
    private int cm_sq;  //댓글 번호
    private int b_sq;   //게시글 번호
    private int m_sq;  //댓글 작성자
    private String writeDate;   //댓글 작성일
    private int parent_sq;  //부모댓글?
    private String content; //댓글내용
    private int comment_level; //댓글-답변글 깊이

    private String id; //member id
    private String nickname;    //member nickname

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    public int getCm_sq() {
        return cm_sq;
    }

    public void setCm_sq(int cm_sq) {
        this.cm_sq = cm_sq;
    }

    public int getM_sq() {
        return m_sq;
    }

    public void setM_sq(int m_sq) {
        this.m_sq = m_sq;
    }

    public int getB_sq() {
        return b_sq;
    }

    public void setB_sq(int b_sq) {
        this.b_sq = b_sq;
    }

    public String getWriteDate() {
        return writeDate;
    }

    public void setWriteDate(String writeDate) {
        this.writeDate = writeDate;
    }

    public int getParent_sq() {
        return parent_sq;
    }

    public void setParent_sq(int parent_sq) {
        this.parent_sq = parent_sq;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public int getComment_level() {
        return comment_level;
    }

    public void setComment_level(int comment_level) {
        this.comment_level = comment_level;
    }
}
