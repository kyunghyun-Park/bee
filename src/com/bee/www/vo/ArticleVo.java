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
    private int comment_count;  //총 댓글 수

    private String filename;

    public String getFilename() {
        return filename;
    }

    public void setFilename(String filename) {
        this.filename = filename;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getNewFileName() {
        return newFileName;
    }

    public void setNewFileName(String newFileName) {
        this.newFileName = newFileName;
    }

    private String address;
    private String newFileName;
    public int getComment_count() {
        return comment_count;
    }

    public void setComment_count(int comment_count) {
        this.comment_count = comment_count;
    }

    public String getCate_name() {
        return cate_name;
    }

    public void setCate_name(String cate_name) {
        this.cate_name = cate_name;
    }

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
