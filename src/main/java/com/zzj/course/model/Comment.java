package com.zzj.course.model;

import java.sql.Timestamp;

public class Comment {
    private String commentid;
    private String reid;
    private String userid;
    private String comment;
    private Timestamp commenttime;
    private String replyid;
    private String username;
    private String userimg;
    private  String rename;

    public String getRename() {
        return rename;
    }

    public void setRename(String rename) {
        this.rename = rename;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getUserimg() {
        return userimg;
    }

    public void setUserimg(String userimg) {
        this.userimg = userimg;
    }

    public String getReplyid() {
        return replyid;
    }

    public void setReplyid(String replyid) {
        this.replyid = replyid;
    }

    public Timestamp getCommenttime() {
        return commenttime;
    }

    public void setCommenttime(Timestamp commenttime) {
        this.commenttime = commenttime;
    }

    public String getCommentid() {
        return commentid;
    }

    public void setCommentid(String commentid) {
        this.commentid = commentid;
    }

    public String getReid() {
        return reid;
    }

    public void setReid(String reid) {
        this.reid = reid;
    }

    public String getUserid() {
        return userid;
    }

    public void setUserid(String userid) {
        this.userid = userid;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }


}
