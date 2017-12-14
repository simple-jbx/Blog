package test;

import java.util.List;
import java.util.Map;
import java.util.UUID;

import bean.Article;
import bean.Comment;
import bean.User;
import service.ArticleService;
import service.CommentService;
import util.DataBaseUtils;
import util.TableUtils;

public class TestMain {
	 public static void main(String[] args) {
		 String id = UUID.randomUUID().toString();
		 System.out.println(id);
	 }
}
