package com.board;

public class CommentBean {
    private int boardNum;
    private String memberId;
    private String commentContent;
    private int commentNum;
    private int re_lev;
    private  int re_seq;
    private String date;

    public int getBoardNum() {
        return boardNum;
    }

    public void setBoardNum(int boardNum) {
        this.boardNum = boardNum;
    }

    public int getCommentNum() {
        return commentNum;
    }

    public void setCommentNum(int commentNum) {
        this.commentNum = commentNum;
    }

    public String getMemberId() {
        return memberId;
    }

    public void setMemberId(String memberId) {
        this.memberId = memberId;
    }

    public String getCommentContent() {
        return commentContent;
    }

    public void setCommentContent(String commentContent) {
        this.commentContent = commentContent;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public int getRe_lev() {
        return re_lev;
    }

    public void setRe_lev(int re_lev) {
        this.re_lev = re_lev;
    }

    public int getRe_seq() {
        return re_seq;
    }

    public void setRe_seq(int re_seq) {
        this.re_seq = re_seq;
    }
}
