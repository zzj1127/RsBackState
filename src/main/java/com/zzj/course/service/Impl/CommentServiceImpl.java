package com.zzj.course.service.Impl;


import com.zzj.course.dao.CommentMapper;
import com.zzj.course.model.Comment;
import com.zzj.course.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CommentServiceImpl implements CommentService {

    @Autowired
    CommentMapper commentMapper;
    @Override
    public int pagecount(){
        return   commentMapper.pagecount();
    }

    @Override
    public List<Comment> findAllComment(int index){
        return commentMapper.findAllComment(index);
    }

    @Override
    public void changeTon(Comment comment){
         commentMapper.changeTon(comment);
    }
    @Override
    public void deletecommentid(String commentid){
        commentMapper.deletecommentid(commentid);
    }
}
