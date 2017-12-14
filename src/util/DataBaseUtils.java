package util;

import java.io.IOException;
import java.io.InputStream;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.nio.file.NoSuchFileException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

public class DataBaseUtils {
	private static String username; //用户名
	private static String password; //密码
	private static String dataBaseName; //数据库名
	static{
		//sae
		config("jdbc.properties");
	}
	
	
	/**
	 * 配置数据库的基本信息
	 * @return void
	 */
	public static void config(String path){
		InputStream inputStream = DataBaseUtils.class.getClassLoader().getResourceAsStream(path);
		Properties p = new Properties();
		try{
			p.load(inputStream);
			username = p.getProperty("db.username");
			password = p.getProperty("db.password");
			dataBaseName = p.getProperty("db.dataBaseName");
			//System.out.println(username);
			//System.out.println(password);
			//System.out.println(dataBaseName);

		}catch (IOException e){
			e.printStackTrace();
		}
	}
	
	
	/**
	 * 获取数据库连接
	 * @return Connection
	 */
	public static Connection getConnection(){
		Connection connection = null;
		try{
			Class.forName("com.mysql.jdbc.Driver");
			//本地
			connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+"blog"+"?useUnicode=true&characterEncoding=utf8","root","41512241");
			//sae
			//connection = DriverManager.getConnection("jdbc:mysql://vctumvepnwfu.mysql.sae.sina.com.cn:10350/"+dataBaseName+"?useUnicode=true&characterEncoding=utf8",username,password);
		}catch (ClassNotFoundException e){
			e.printStackTrace();
		}catch (SQLException e){
			e.printStackTrace();
		}
		return connection;
	}
	
	
	/**
	 * 关闭数据库连接
	 * @param connection
	 * @param statement
	 * @param rs
	 */
	public static void closeConnection(Connection connection, PreparedStatement statement,ResultSet rs){
		try{
			if(rs != null){
				rs.close();
			}
			if(statement != null){
				statement.close();
			}
			if(connection != null){
				connection.close();
			}
		}catch (Exception e) {
			e.fillInStackTrace();
		}
	}
	
	
	/**
	 * DML操作   增、删、改
	 * @param sql
	 * @param objects
	 * Object...objects 变长参数  可以理解为 Object数组
	 **/
	public static void update(String sql, Object...objects){
		Connection connection = getConnection();
		PreparedStatement statement = null;
		try{
			statement = (PreparedStatement) connection.prepareStatement(sql);
			for(int i = 0; i < objects.length; i++) {
				statement.setObject(i+1, objects[i]);
			}
			statement.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			closeConnection(connection, statement, null);
		}		
	}
	
	/**
	 * 查询数据，以list形式返回
	 * @param sql
	 * @param objects
	 * @return
	 * @throws SQLException
	 */
	public static List<Map<String, Object> > queryForList(String sql, Object...objects) {
		List<Map<String, Object> > result = new ArrayList<Map<String, Object> >();
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet rs = null;
		try{
			statement = connection.prepareStatement(sql);
			for(int i = 0; i < objects.length; i++) {
				statement.setObject(i+1, objects[i]);
			}
			
			rs = statement.executeQuery();
			while(rs.next()) {
				ResultSetMetaData resultSetMetaData = rs.getMetaData();
				int count = resultSetMetaData.getColumnCount(); //获取列数
				Map<String, Object> map = new HashMap<String, Object>();
				for(int i = 0; i < count; i++){
					map.put(resultSetMetaData.getColumnName(i+1), rs.getObject(resultSetMetaData.getColumnName(i+1)));
				}
				result.add(map);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally{
		closeConnection(connection, statement, rs);
	}
	return result;
	}
	
	/**
	 * 查询出数据，并且map返回
	 * @param sql
	 * @param objects
	 * @return
	 * @throws SQLEXception
	 */
	public static Map<String, Object> queryForMap(String sql, Object...objects) {
		Map<String, Object> result = new HashMap<String, Object>();
		List<Map<String, Object> > list = queryForList(sql, objects);
		if(list.size() != 1){
			return null;
		}
		result = list.get(0);
		return result;
	}
	
	/**
	 * 查询出数据， 返回一个JavaBean
	 * @param sql
	 * @param clazz
	 * @param objets
	 * @return
	 * @throws NOSuchFileException
	 * @throws SecurityException
	 */
	public static <T>T queryForBean(String sql, Class clazz, Object...objects){
		T obj = null;
		Map<String, Object> map = null;
		Field field = null;
		try{
			obj = (T) clazz.newInstance(); //创建一个Bean实例
			map = queryForMap(sql, objects); //将结果集先放在一个map中
		}catch (InstantiationException | IllegalAccessException e) {
			e.printStackTrace();
		}
		
		if(map == null)
			return null;
		
		//遍历map
		for(String columnName : map.keySet()) {
			Method method = null;
			String propertyName = StringUtils.columnToProperty(columnName);
			try {
				field = clazz.getDeclaredField(propertyName);
			} catch (NoSuchFieldException e) {
				e.printStackTrace();
			} catch (SecurityException e) {
				e.printStackTrace();
			}
			
			//获取JavaBean中的字段
			String fieldType = field.toString().split(" ")[1]; //获取字段类型
			//System.out.println(fieldType);
			Object value = map.get(columnName);
			if(value == null)
				continue; 
			
			String setMethodName = "set" + StringUtils.upperCaseFirstCharacter(propertyName);
			try {
				String valueType = value.getClass().getName(); 
				if(!fieldType.equalsIgnoreCase(valueType)) {
					if(fieldType.equalsIgnoreCase("java.lang.Integer")) {
						value = Integer.parseInt(String.valueOf(value));
					} else if (fieldType.equalsIgnoreCase("java.lang.String")) {
						value = String.valueOf(value);
					} else if (fieldType.equalsIgnoreCase("java.util.Date")) {
						valueType = "java.util.Date";
						String dateStr = String.valueOf(value);
						Timestamp ts = Timestamp.valueOf(dateStr);
						Date date = new Date(ts.getTime());
						value = date;
					}
				}
	            method = clazz.getDeclaredMethod(setMethodName, Class.forName(fieldType));
				method.invoke(obj, value);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return obj;
	}
}
