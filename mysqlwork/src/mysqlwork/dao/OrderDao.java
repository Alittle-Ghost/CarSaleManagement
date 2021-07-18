package mysqlwork.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import mysqlwork.model.Order;

public class OrderDao {
	private static Connection getConnection() {
		Connection cnn = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			String dburl = "jdbc:mysql://127.0.0.1:3306/new?useUnicode=true&characterEncoding=utf-8";
			String dbuser = "root";
			String dbpwd = "123";
			cnn = DriverManager.getConnection(dburl, dbuser, dbpwd);

		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("SQL问题：" + e.getMessage());
		}
		return cnn;
	}

	public static List<Order> showAllOrder() {
		List<Order> list=new ArrayList<Order>();
		try {
			Connection cnn = getConnection();
			String sql = "select * from orders";
			PreparedStatement cmd = cnn.prepareStatement(sql);
			ResultSet rs = cmd.executeQuery();
			
			while(rs.next()){
			Order em=new Order();	
			em.setOrderNumber(rs.getInt(1));
			em.setOrderDate(rs.getString(2));
			em.setRequireDate(rs.getString(3));
			em.setShippedDate(rs.getString(4));
			em.setStatus(rs.getString(5));
			em.setComments(rs.getString(6));
			em.setCustomerNumber(rs.getInt(7));

			list.add(em);
			}
			cnn.close();
		}catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("SQL ERROR" + e.getMessage());
		}
		return list;
	}
	

	public static List<Order> searchOrder(Order or) {
		List<Order> list=new ArrayList<Order>();
		try {
			Connection cnn = getConnection();
			String sql = "select * from orders where customerNumber=?";
			PreparedStatement cmd = cnn.prepareStatement(sql);
			cmd.setInt(1,or.getCustomerNumber());
			ResultSet rs = cmd.executeQuery();
			
			while(rs.next()){
			Order em=new Order();	
			em.setOrderNumber(rs.getInt(1));
			em.setOrderDate(rs.getString(2));
			em.setRequireDate(rs.getString(3));
			em.setShippedDate(rs.getString(4));
			em.setStatus(rs.getString(5));
			em.setComments(rs.getString(6));
			em.setCustomerNumber(rs.getInt(7));
			
			list.add(em);
			}
			cnn.close();
		}catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("SQL ERROR" + e.getMessage());
		}
		return list;
	}
	//查询订单是否存在
	public static boolean searchOrderByNumberT(Order or) {
		boolean flag = false;
		try {
			Connection cnn = getConnection();
			String sql = "select count(*) from orders where orderNumber=?";
			PreparedStatement cmd = cnn.prepareStatement(sql);
			cmd.setInt(1,or.getOrderNumber());
			ResultSet rs = cmd.executeQuery();
			if(rs.next()) {
				int num = rs.getInt(1);
				if(num > 0) {
					flag = true;
				}
			}
			cnn.close();
		}catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("SQL ERROR" + e.getMessage());
		}
		return flag;
	}
	//查询订单详情
	public static List<Order> searchOrderByNumber(Order or) {
		List<Order> list=new ArrayList<Order>();
		try {
			Connection cnn = getConnection();
			String sql = "select * from orders where orderNumber=?";
			PreparedStatement cmd = cnn.prepareStatement(sql);
			cmd.setInt(1,or.getOrderNumber());
			ResultSet rs = cmd.executeQuery();
			
			while(rs.next()){
			Order em=new Order();	
			em.setOrderNumber(rs.getInt(1));
			em.setOrderDate(rs.getString(2));
			em.setRequireDate(rs.getString(3));
			em.setShippedDate(rs.getString(4));
			em.setStatus(rs.getString(5));
			em.setComments(rs.getString(6));
			em.setCustomerNumber(rs.getInt(7));

			list.add(em);
			}
			cnn.close();
		}catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("SQL ERROR" + e.getMessage());
		}
		return list;
	}
	public static int findCount() {
		int num = 0;
		try {
			Connection cnn = getConnection();
			Statement cmd = cnn.createStatement();
			String sql = "select count(*) from orders";
			ResultSet rs = cmd.executeQuery(sql);
			while(rs.next()) {
				num = rs.getInt(1);
			}
			cnn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("SQL ����" + e.getMessage());
		}
		return num;
	}
	
	public static List<Order> getAllOrder(int orderNumber) {
		List<Order> list = new ArrayList<Order>();
			try {
				Connection cnn = getConnection();
				//Statement cmd = cnn.createStatement();
				String sql = "select * from orders where orderNumber=? limit ?,?";
				PreparedStatement cmd = cnn.prepareStatement(sql);
				
				cmd.setInt(1, orderNumber);
				ResultSet rs = cmd.executeQuery();
				
				while (rs.next()) {
					
					Order em = new Order();
					em.setOrderNumber(rs.getInt(1));
					em.setOrderDate(rs.getString(2));
					em.setRequireDate(rs.getString(3));
					em.setShippedDate(rs.getString(4));
					em.setStatus(rs.getString(5));
					em.setComments(rs.getString(6));
					em.setCustomerNumber(rs.getInt(7));
					list.add(em);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				System.out.println("SQL ����" + e.getMessage());
			}
			return list;
		}
	
	public static boolean delOrder(Order cus) {	
		boolean flag = false;
		try {
			Connection cnn = getConnection();
			Statement cmd = cnn.createStatement();
			String sql ="delete from orders where orderNumber="+cus.getOrderNumber();
			int num = cmd.executeUpdate(sql);
			if (num > 0) {
				flag = true;
			}
			cnn.close();
		}catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("SQL ERROR" + e.getMessage());
		}
		return flag;
	
}
	
	public static List<Order> getAll(int page) {
		List<Order> list = new ArrayList<Order>();
		try {
			Connection cnn = getConnection();
			//Statement cmd = cnn.createStatement();
			String sql = "select * from orders limit ?,?";
			PreparedStatement cmd = cnn.prepareStatement(sql);
			//��һ�����������÷��ص���ʼ��������.�ڶ���������������������ص�����
			cmd.setInt(1,(page-1)*Order.PAGE_SIZE);
			cmd.setInt(2, Order.PAGE_SIZE);
			ResultSet rs = cmd.executeQuery();
			
			// �����ݵĳ��Ƚ���ѭ����ȡ
			while (rs.next()) {
				// �Ա����н��л�ȡ��Ӧ���е�ֵ
				Order em = new Order();
				em.setOrderNumber(rs.getInt(1));
				em.setOrderDate(rs.getString(2));
				em.setRequireDate(rs.getString(3));
				em.setShippedDate(rs.getString(4));
				em.setStatus(rs.getString(5));
				em.setComments(rs.getString(6));
				em.setCustomerNumber(rs.getInt(7));
				list.add(em);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("SQL���⣺" + e.getMessage());
		}
		return list;
	}
//�����û�
public static boolean addOrder(Order cus) {
	boolean flag = false;
try {
	Connection cnn = getConnection();
	Statement cmd = cnn.createStatement();
	String sql = "insert into orders(orderNumber,orderDate, requireedDate,"
			+ "ShippedDate, status, comments, CustomerNumber) values(" + cus.getOrderNumber() + "','"
			+ cus.getOrderDate() + "','" + cus.getRequireDate() + "','" + cus.getShippedDate() + "','"
			+ cus.getStatus() + "','" + cus.getComments() + "','" + cus.getCustomerNumber()  + ")";
	int num = cmd.executeUpdate(sql);
	if(num>0) {
		flag = true;
	}
	cnn.close();
}catch (SQLException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
	System.out.println("SQL ERROR" + e.getMessage());
}
return flag;
}

}
