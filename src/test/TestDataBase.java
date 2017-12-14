package test;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.UUID;

import bean.User;
import service.ArticleService;
import util.DataBaseUtils;

public class TestDataBase {
	public static void main(String[] args) throws SQLException {
		DataBaseUtils.getConnection();
	}
	
}
