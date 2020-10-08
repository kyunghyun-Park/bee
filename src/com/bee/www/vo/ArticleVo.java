package com.bee.www.vo;

public class ArticleVo {
    private int b_sq;
    private int m_sq;
    private int c_sq;
    private String title;
    private String content;
    private int hit;
    private String writeDate;

    private String id; //member id
    private String nickname;    //member nickname
    private String cate_name;   //category name

    public int getC_sq() {
        return c_sq;
    }

    public void setC_sq(int c_sq) {
        this.c_sq = c_sq;
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    public int getB_sq() {
        return b_sq;
    }

    public void setB_sq(int b_sq) {
        this.b_sq = b_sq;
    }

    public int getM_sq() {
        return m_sq;
    }

    public void setM_sq(int m_sq) {
        this.m_sq = m_sq;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public int getHit() {
        return hit;
    }

    public void setHit(int hit) {
        this.hit = hit;
    }

    public String getWriteDate() {
        return writeDate;
    }

    public void setWriteDate(String writeDate) {
        this.writeDate = writeDate;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }
}
