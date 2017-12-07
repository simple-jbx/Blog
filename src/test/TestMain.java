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
		 ArticleService artice = new ArticleService();
		 List<Map<String,Object>>  articles2 = artice.getArticlesByCategoryId(2, 0, 6);
			Map<String, Object> map = articles2.get(0);
			System.out.println(map.toString());
		}
}
