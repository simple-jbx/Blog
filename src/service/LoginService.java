package service;

import bean.User;
import util.DataBaseUtils;

/**
 * 用户登录服务类
 * @author simple
 */
public class LoginService {
	
	public User getUser(String username) {
		String sql = "select * from blog_user where username = ?";
		User user = DataBaseUtils.queryForBean(sql, User.class, username);
		if(user == null)
			return null;
		return user;
	}
}
