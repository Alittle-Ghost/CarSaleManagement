package mysqlwork.dao;

import java.sql.Connection;

import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import mysqlwork.model.Orderdetails;

public class OrderdetailsDao {
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

	public static List<Orderdetails> showAllOrderdetails() {
		List<Orderdetails> list = new ArrayList<Orderdetails>();
		try {
			Connection cnn = getConnection();
			String sql = "select * from orderdetails";
			PreparedStatement cmd = cnn.prepareStatement(sql);
			ResultSet rs = cmd.executeQuery();

			while (rs.next()) {
				Orderdetails em = new Orderdetails();
				em.setOrderNumber(rs.getInt(1));
				em.setProductCode(rs.getString(2));
				em.setQuantityOrdered(rs.getInt(3));
				em.setPriceEach(rs.getString(4));
				em.setOrderLineNumber(rs.getString(5));

				list.add(em);
			}
			cnn.close();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("SQL ERROR" + e.getMessage());
		}
		return list;
	}
	public static List<Orderdetails> searchOrderdetails(Orderdetails orD) {
		List<Orderdetails> list = new ArrayList<Orderdetails>();
		try {
			Connection cnn = getConnection();
			String sql = "select * from orderdetails where orderNumber=?";
			PreparedStatement cmd = cnn.prepareStatement(sql);
			cmd.setInt(1,orD.getOrderNumber());
			ResultSet rs = cmd.executeQuery();

			while (rs.next()) {
				Orderdetails em = new Orderdetails();
				em.setOrderNumber(rs.getInt(1));
				em.setProductCode(rs.getString(2));
				em.setQuantityOrdered(rs.getInt(3));
				em.setPriceEach(rs.getString(4));
				em.setOrderLineNumber(rs.getString(5));

				list.add(em);
			}
			cnn.close();

		} catch (SQLException e) {
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
			String sql = "select count(*) from Orderdeatils";
			ResultSet rs = cmd.executeQuery(sql);
			while(rs.next()) {
				num = rs.getInt(1);
			}
			cnn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("SQL 错误" + e.getMessage());
		}
		return num;
	}
	
	public static List<Orderdetails> getAllOrderdetails(int orderNumber) {
		List<Orderdetails> list = new ArrayList<Orderdetails>();
			try {
				Connection cnn = getConnection();
				//Statement cmd = cnn.createStatement();
				String sql = "select * from orderdetails where orderNumber=? limit ?,?";
				PreparedStatement cmd = cnn.prepareStatement(sql);
				
				cmd.setInt(1, orderNumber);
				ResultSet rs = cmd.executeQuery();
				
				while (rs.next()) {
					
					Orderdetails em = new Orderdetails();
					em.setOrderNumber(rs.getInt(1));
					em.setProductCode(rs.getString(2));
					em.setQuantityOrdered(rs.getInt(3));
					em.setPriceEach(rs.getString(4));
					em.setOrderLineNumber(rs.getString(5));
					list.add(em);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				System.out.println("SQL 错误" + e.getMessage());
			}
			return list;
		}
	
	public static boolean delOrderdetails(Orderdetails cus) {	
		boolean flag = false;
		try {
			Connection cnn = getConnection();
			Statement cmd = cnn.createStatement();
			String sql ="delete from orderdetails where orderNumber="+cus.getOrderNumber();
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
	
	public static List<Orderdetails> getAll(int page) {
		List<Orderdetails> list = new ArrayList<Orderdetails>();
		try {
			Connection cnn = getConnection();
			//Statement cmd = cnn.createStatement();
			String sql = "select * from orderdetails limit ?,?";
			PreparedStatement cmd = cnn.prepareStatement(sql);
			//第一个参数，设置返回的起始的索引号.第二个参数，从起点索引返回的条数
			cmd.setInt(1,(page-1)*Orderdetails.PAGE_SIZE);
			cmd.setInt(2, Orderdetails.PAGE_SIZE);
			ResultSet rs = cmd.executeQuery();
			
			// 对数据的长度进行循环获取
			while (rs.next()) {
				// 对表的列进行获取对应的列的值
				Orderdetails em = new Orderdetails();
				em.setOrderNumber(rs.getInt(1));
				em.setProductCode(rs.getString(2));
				em.setQuantityOrdered(rs.getInt(3));
				em.setPriceEach(rs.getString(4));
				em.setOrderLineNumber(rs.getString(5));
				list.add(em);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("SQL问题：" + e.getMessage());
		}
		return list;
	}
//添加用户
public static boolean addOrderdetail(Orderdetails cus) {
	boolean flag = false;
try {
	Connection cnn = getConnection();
	Statement cmd = cnn.createStatement();
	String sql = "insert into orderdetails(orderNumber,productCode, quantityOrdered,"
			+ "priceEach, orderLineNumber) values(" + cus.getOrderNumber() + "','"
			+ cus.getProductCode() + "','" + cus.getQuantityOrdered() + "','" + cus.getPriceEach() + "','"
			+ cus.getOrderLineNumber() + ")";
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
