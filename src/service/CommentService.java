package service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import bean.Comment;
import util.DataBaseUtils;

public class CommentService {
	/**
	 * 保存评论
	 */
	public void saveComment(Comment comment){
	    String sql = "insert into blog_comment(id,user_id,content,article_id,create_time,update_time,is_delete) values(?,?,?,?,?,?,?)";
	    DataBaseUtils.update(sql,comment.getId(),comment.getUserId(),
	            comment.getContent(),comment.getArticleId(),new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()),new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()),0);
	}
	
	 /**
     * 根据文章id查询它的所有评论
     * @param id
     * @return
     */
    public List<Map<String,Object>> getCommentsByArticleId(String id){
        return DataBaseUtils.queryForList("select b.username ,a.content, a.update_time from blog_comment a left JOIN blog_user b " +
                 "on a.user_id = b.id  where a.article_id = ? order by a.update_time", id);
    }
}
