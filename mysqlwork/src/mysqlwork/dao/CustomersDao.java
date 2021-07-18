package mysqlwork.dao;

import java.sql.Connection;

import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import mysqlwork.model.Customers;

public class CustomersDao {
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

	public static List<Customers> showAllCustomer() {
		List<Customers> list = new ArrayList<Customers>();// ����list���ϣ����ڱ���User����
		try {
			Connection cnn = getConnection();
			String sql = "select * from customers";
			PreparedStatement cmd = cnn.prepareStatement(sql);
			ResultSet rs = cmd.executeQuery();

			while (rs.next()) {
				Customers em = new Customers();// ����User�������ڱ��ִ����ݿ������������
				em.setCustomerNumber(rs.getInt(1));
				em.setCustomerName(rs.getString(2));
				em.setContactLastName(rs.getString(3));
				em.setContactFirstName(rs.getString(4));
				em.setPhone(rs.getString(5));
				em.setAddressLine1(rs.getString(6));
				em.setAddressLine2(rs.getString(7));
				em.setCity(rs.getString(8));
				em.setState(rs.getString(9));
				em.setPostalCode(rs.getString(10));
				em.setCountry(rs.getString(11));
				em.setSalesRepEmployeeNumber(rs.getInt(12));
				em.setCreditlimit(rs.getString(13));

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

	// 获取当前表中的总数量
	public static int findCount() {
		int num = 0;
		try {
			Connection cnn = getConnection();
			Statement cmd = cnn.createStatement();
			String sql = "select count(*) from customers";
			ResultSet rs = cmd.executeQuery(sql);
			while (rs.next()) {
				num = rs.getInt(1);
			}
			cnn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("SQL问题：" + e.getMessage());
		}
		return num;
	}

	// 删除用户
	public static boolean delCustomer(Customers cus) {
		boolean flag = false;
		try {
			Connection cnn = getConnection();
			Statement cmd = cnn.createStatement();
			String sql = "delete from customers where customerNumber=" + cus.getCustomerNumber();
			int num = cmd.executeUpdate(sql);
			if (num > 0) {
				flag = true;
			}
			cnn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("SQL ERROR" + e.getMessage());
		}
		return flag;

	}
	//按规定显示客户
	public static List<Customers> getAllCustomers(int salesRepEmployeeNumber) {
		List<Customers> list = new ArrayList<Customers>();
		try {
			Connection cnn = getConnection();
			// Statement cmd = cnn.createStatement();
			String sql = "select * from customers where salesRepEmployeeNumber=?";
			PreparedStatement cmd = cnn.prepareStatement(sql);
			// 第一个参数，设置返回的起始的索引号.第二个参数，从起点索引返回的条数
			cmd.setInt(1, salesRepEmployeeNumber);
			ResultSet rs = cmd.executeQuery();

			// 对数据的长度进行循环获取
			while (rs.next()) {
				// 对表的列进行获取对应的列的值
				Customers em = new Customers();
				em.setCustomerNumber(rs.getInt(1));
				em.setCustomerName(rs.getString(2));
				em.setContactLastName(rs.getString(3));
				em.setContactFirstName(rs.getString(4));
				em.setPhone(rs.getString(5));
				em.setAddressLine1(rs.getString(6));
				em.setAddressLine2(rs.getString(7));
				em.setCity(rs.getString(8));
				em.setState(rs.getString(9));
				em.setPostalCode(rs.getString(10));
				em.setCountry(rs.getString(11));
				em.setSalesRepEmployeeNumber(rs.getInt(12));
				em.setCreditlimit(rs.getString(13));
				list.add(em);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("SQL问题：" + e.getMessage());
		}
		return list;
	}

	// 查询所有用户的信息 当前显示的页码
	public static List<Customers> getAll(int page) {
		List<Customers> list = new ArrayList<Customers>();
		try {
			Connection cnn = getConnection();
			// Statement cmd = cnn.createStatement();
			String sql = "select * from customers limit ?,?";
			PreparedStatement cmd = cnn.prepareStatement(sql);
			// 第一个参数，设置返回的起始的索引号.第二个参数，从起点索引返回的条数
			cmd.setInt(1, (page - 1) * Customers.PAGE_SIZE);
			cmd.setInt(2, Customers.PAGE_SIZE);
			ResultSet rs = cmd.executeQuery();

			// 对数据的长度进行循环获取
			while (rs.next()) {
				// 对表的列进行获取对应的列的值
				Customers em = new Customers();
				em.setCustomerNumber(rs.getInt(1));
				em.setCustomerName(rs.getString(2));
				em.setContactLastName(rs.getString(3));
				em.setContactFirstName(rs.getString(4));
				em.setPhone(rs.getString(5));
				em.setAddressLine1(rs.getString(6));
				em.setAddressLine2(rs.getString(7));
				em.setCity(rs.getString(8));
				em.setState(rs.getString(9));
				em.setPostalCode(rs.getString(10));
				em.setCountry(rs.getString(11));
				em.setSalesRepEmployeeNumber(rs.getInt(12));
				em.setCreditlimit(rs.getString(13));
				list.add(em);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("SQL问题：" + e.getMessage());
		}
		return list;
	}

	// 添加用户
	public static boolean addCustomer(Customers cus) {
		boolean flag = false;
		try {
			Connection cnn = getConnection();
//		String sql ="insert into customers(customerNumber,customerName, contactLastName,"
//				+ "contactFirstName, phone, addressLine1, addressLine2, city, state,"
//				+ "postalCode, country, salesRepEmployeeNumber, creditLimit) values(?,?,"
//				+ "?,?,?,?,?,?,?,?,?,?,?";
//		PreparedStatement cmd = cnn.prepareStatement(sql);
//		cmd.setInt(1, cus.getCustomerNumber());
//		cmd.setString(2, cus.getCustomerName());
//		cmd.setString(3,cus.getContactFirstName());
//		cmd.setString(4, cus.getContactLastName());
//		cmd.setString(5, cus.getPhone());
//		cmd.setString(6, cus.getAddressLine1());
//		cmd.setString(7, cus.getAddressLine2());
//		cmd.setString(8,  cus.getCity());
//		cmd.setString(9, cus.getState());
//		cmd.setString(10, cus.getPostalCode());
//		cmd.setString(11,  cus.getCountry());
//		cmd.setInt(12,  cus.getSalesRepEmployeeNumber());
//		cmd.setString(13,  cus.getCreditlimit());
			Statement cmd = cnn.createStatement();
			String sql = "insert into customers(customerNumber,customerName, contactLastName,"
					+ "contactFirstName, phone, addressLine1, addressLine2, city, state,"
					+ "postalCode, country, salesRepEmployeeNumber, creditLimit) values(" + cus.getCustomerNumber()
					+ ",'" + cus.getCustomerName() + "','" + cus.getContactFirstName() + "','"
					+ cus.getContactLastName() + "','" + cus.getPhone() + "','" + cus.getAddressLine1() + "','"
					+ cus.getAddressLine2() + "','" + cus.getCity() + "','" + cus.getState() + "','"
					+ cus.getPostalCode() + "','" + cus.getCountry() + "'," + cus.getSalesRepEmployeeNumber() + ","
					+ cus.getCreditlimit() + ")";
			int num = cmd.executeUpdate(sql);
			if (num > 0) {
				flag = true;
			}
			cnn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("SQL ERROR" + e.getMessage());
		}
		return flag;
	}

	// 查询客户列表
	public static List<Customers> searchCustomersInfo(Customers cus) {
		List<Customers> list = new ArrayList<Customers>();
		try {
			Connection cnn = getConnection();
			String sql = "select * from customers where customerNumber=?";
			PreparedStatement cmd = cnn.prepareStatement(sql);
			cmd.setInt(1, cus.getCustomerNumber());
			ResultSet rs = cmd.executeQuery();

			while (rs.next()) {
				Customers em = new Customers();
				em.setCustomerNumber(rs.getInt(1));
				em.setCustomerName(rs.getString(2));
				em.setContactLastName(rs.getString(3));
				em.setContactFirstName(rs.getString(4));
				em.setPhone(rs.getString(5));
				em.setAddressLine1(rs.getString(6));
				em.setAddressLine2(rs.getString(7));
				em.setCity(rs.getString(8));
				em.setState(rs.getString(9));
				em.setPostalCode(rs.getString(10));
				em.setCountry(rs.getString(11));
				em.setSalesRepEmployeeNumber(rs.getInt(12));
				em.setCreditlimit(rs.getString(13));

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

	// 查询客户列表是否存在
	public static boolean searchCustomers(Customers cus) {
		boolean flag = false;
		try {
			Connection cnn = getConnection();
			String sql = "select count(*) from customers where customerNumber=?";
			PreparedStatement cmd = cnn.prepareStatement(sql);
			cmd.setInt(1, cus.getCustomerNumber());
			ResultSet rs = cmd.executeQuery();

			if (rs.next()) {
				int num = rs.getInt(1);
				if (num > 0) {
					flag = true;
				}
			}
			cnn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("SQL ERROR" + e.getMessage());
		}
		return flag;
	}

}
