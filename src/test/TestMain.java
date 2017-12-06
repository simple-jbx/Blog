package test;

import bean.Article;
import bean.Comment;
import bean.User;
import util.TableUtils;

public class TestMain {
	 public static void main(String[] args) {
		 String sql = TableUtils.getCreateTableSql(Comment.class);
	     System.out.println(sql);
	    }
}
