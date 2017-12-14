package service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import util.DataBaseUtils;

public class ArticleService {
	
	/**
	 * 通过类别获取文章列表
	 * @categoryId
	 * @param start
	 * @param end
	 */
	public List<Map<String, Object> > getArticlesByCategoryId(Integer catagoryId, Integer start, Integer end) {
		String sql = "select id, header, name, author, create_time," 
				+ "description from blog_article where 1 = 1" 
				+ " and is_delete = 0 and is_published = 1" 
				+ " and category_id = ?" 
				+ " order by update_time desc limit ?, ?";
		return DataBaseUtils.queryForList(sql, catagoryId, start, end);
	}
	
	public List<Map<String, Object> > getArticlesByCategoryId(Integer catagoryId) {
		String sql = "select id, header, name, author, create_time," 
				+ "description from blog_article where 1 = 1" 
				+ " and is_delete = 0 and is_published = 1" 
				+ " and category_id = ?" 
				+ " order by update_time desc";
		return DataBaseUtils.queryForList(sql, catagoryId);
	}
	
	/**
	 * 通过Id获取文章内容
	 * @param id
	 * @return
	 */
	public Map<String, Object> getContentByArticleId(String id) {
		String sql = "select * from blog_article a inner join blog_category b on a.category_id = b.category_id where a.id = ?";
		return DataBaseUtils.queryForMap(sql, id);	
	}
	
	
	/**
	 * 通过类别获取文章列表
	 * @categoryId
	 * @param start
	 * @param end
	 */
	public List<Map<String, Object> > getAllArticles() {
		String sql = "select id, header, name, author, create_time, update_time," 
				+ "description from blog_article where 1 = 1" 
				+ " and is_delete = 0 and is_published = 1" 
				+ " order by update_time desc";
		return DataBaseUtils.queryForList(sql);
	}
	
	
	/**
	 * 添加文章
	 */
	public void addArticle(Object...objects) {
		String sql = "insert into blog_article(id,header,name,content,author,"
	            + "description,is_published,is_delete,create_time,update_time"
	            + ",user_id,category_id) VALUES (?,?,?,?,?,?,?,?,?,?,?,?) ";	
		DataBaseUtils.update(sql, objects);
		return;
	}
	
	
	/**
	 * 修改文章
	 */
	public void updateArticleById(Object...objects) {
		//TODO...
		String sql = "update blog_article set name= ?, category_id= ?, description=?, content= ?, update_time= ? where id = ?";
		DataBaseUtils.update(sql, objects);
		return;
	}
	
	
	/**
	 * 删除文章
	 * @param articleId
	 */
	public void deleteArticleById(String articleId) {
		//TODO...
		String ArticleSql = "delete from blog_article where id = ?";
		String CommentSql = "delete from blog_comment where article_id = ?";
		DataBaseUtils.update(ArticleSql, articleId);
		DataBaseUtils.update(CommentSql, articleId);
		return;
	}
	
	/**
	 * @param author
	 * 获取 author 的所有文章
	 */
	public List<Map<String, Object> > getArticlesByAuthor(String author) {
		String sql = "select id, header, name, author, create_time, update_time," 
				+ "description from blog_article where 1 = 1" 
				+ " and is_delete = 0 and is_published = 1"
				+ " and author = ?";
			//System.out.println(sql);
		return DataBaseUtils.queryForList(sql, author);
	}
	

}
