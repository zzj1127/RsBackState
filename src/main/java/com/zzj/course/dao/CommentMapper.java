package com.zzj.course.dao;

import com.zzj.course.model.Comment;

import java.util.List;

public interface CommentMapper {

   public int pagecount();

   public  List<Comment> findAllComment(int index);

   public void changeTon(Comment comment);

   public void deletecommentid(String commentid);
}
