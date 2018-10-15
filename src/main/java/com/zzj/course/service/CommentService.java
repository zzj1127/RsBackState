package com.zzj.course.service;

import com.zzj.course.model.Comment;

import java.util.List;

public interface CommentService {
   public int pagecount();

   public List<Comment> findAllComment(int index);

  public void changeTon(Comment comment);

   public void deletecommentid(String commentid);
}
