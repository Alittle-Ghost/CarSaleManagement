package mysqlwork.dao;


import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import mysqlwork.model.Customers;
import mysqlwork.model.Employees;


public class EmployeesDao{
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
//搜索员工
public static boolean searchUser(Employees em) {
	boolean flag = false;
	try{
		Connection cnn = getConnection();
		//Statement cmd = cnn.createStatement();
		//String sql = "select * from employees where email='"+em.getEmail()+"' and password=password('"+em.getPassword()+"')";

		String sql = "select count(*) from employees where email=? and `password`=password(?)";
		PreparedStatement cmd = cnn.prepareStatement(sql);
		cmd.setString(1, em.getEmail());
		cmd.setString(2, em.getPassword());
		
	//做增删改的时候executeUpdate，返回的是执行后数据库响应的行数
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
		System.out.println("SQL问题：" + e.getMessage());
	}
	return flag;
}
//搜索当前员工信息
public static List<Employees> selfInfo(Employees em) {
	List<Employees> list=new ArrayList<Employees>();
	try{
		Connection cnn = getConnection();
		//Statement cmd = cnn.createStatement();
		//String sql = "select * from employees where email='"+em.getEmail()+"' and password=password('"+em.getPassword()+"')";

		String sql = "select * from employees where email=? and `password`=password(?)";
		PreparedStatement cmd = cnn.prepareStatement(sql);
		cmd.setString(1, em.getEmail());
		cmd.setString(2, em.getPassword());
		
	//做增删改的时候executeUpdate，返回的是执行后数据库响应的行数
		ResultSet rs = cmd.executeQuery();
		while(rs.next()){
			em.setEmployeeNumber(rs.getInt(1));
			em.setLastName(rs.getString(2));
			em.setFirstName(rs.getString(3));
			em.setExtension(rs.getString(4));
			em.setEmail(rs.getString(5));
			em.setOfficeCode(rs.getString(6));
			em.setReportsTo(rs.getInt(7));
			em.setJobTitle(rs.getString(8));
			
			list.add(em);
			}
	cnn.close();
	}catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
		System.out.println("SQL问题：" + e.getMessage());
	}
	return list;
}
//搜索员工姓名
public static String searchName(Employees em) {
	String username = null;
	try{
		Connection cnn = getConnection();
		String sql = "select * from employees where email=? and `password`=password(?)";
		PreparedStatement cmd = cnn.prepareStatement(sql);
		cmd.setString(1, em.getEmail());
		cmd.setString(2, em.getPassword());

		ResultSet rs = cmd.executeQuery();
		if(rs.next()) {
			int num = rs.getInt("employeeNumber");
			if(num > 0) {
//				Employees name = new Employees();
				String firstName = rs.getString("firstName");
				String lastName = rs.getString("lastName");
				username = firstName + lastName;
				//System.out.print(username);
			}
		}
	cnn.close();
	}catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
		System.out.println("SQL问题：" + e.getMessage());
	}
	return username;
}	
//搜索员工等级
public static String searchJobTitle(Employees em) {
	String jobtitle = null;
	try{
		Connection cnn = getConnection();
		String sql = "select * from employees where email=? and `password`=password(?)";
		PreparedStatement cmd = cnn.prepareStatement(sql);
		cmd.setString(1, em.getEmail());
		cmd.setString(2, em.getPassword());

		ResultSet rs = cmd.executeQuery();
		if(rs.next()) {
			int num = rs.getInt("employeeNumber");
			if(num > 0) {
				jobtitle = rs.getString("jobTitle");
				//System.out.print(jobtitle);
			}
		}
	cnn.close();
	}catch (SQLException e) {
		e.printStackTrace();
		System.out.println("SQL问题：" + e.getMessage());
	}
	return jobtitle;
}
//搜索员工编号
public static Integer searchemployeeNumber(Employees em) {
	int emNum = 0;
	try{
		Connection cnn = getConnection();
		String sql = "select * from employees where email=? and `password`=password(?)";
		PreparedStatement cmd = cnn.prepareStatement(sql);
		cmd.setString(1, em.getEmail());
		cmd.setString(2, em.getPassword());

		ResultSet rs = cmd.executeQuery();
		if(rs.next()) {
			emNum = rs.getInt("employeeNumber");
		}
	cnn.close();
	}catch (SQLException e) {
		e.printStackTrace();
		System.out.println("SQL问题：" + e.getMessage());
	}
	return emNum;
}
//搜索员工编号
public static Integer searchReportsTO(Employees em) {
	int reT = 0;
	try{
		Connection cnn = getConnection();
		String sql = "select * from employees where email=? and `password`=password(?)";
		PreparedStatement cmd = cnn.prepareStatement(sql);
		cmd.setString(1, em.getEmail());
		cmd.setString(2, em.getPassword());

		ResultSet rs = cmd.executeQuery();
		if(rs.next()) {
			reT = rs.getInt("reportsTo");
		}
	cnn.close();
	}catch (SQLException e) {
		e.printStackTrace();
		System.out.println("SQL问题：" + e.getMessage());
	}
	return reT;
}
	
////搜索可管理员工
//public static List<Employees> searchReportTo(Employees em) {
//	List<Employees> list=new ArrayList<Employees>();
//	try {
//		Connection cnn = getConnection();
//		String sql="select * from employees where reportsTo=?";
//		PreparedStatement cmd = cnn.prepareStatement(sql);
//		cmd.setInt(1,em.getEmployeeNumber());
//		ResultSet rs = cmd.executeQuery();
//		while(rs.next()){
//			em.setEmployeeNumber(rs.getInt("employeesNumber"));
//			em.setLastName(rs.getString("lastName"));
//			em.setFirstName(rs.getString("firstName"));
//			em.setExtension(rs.getString("extension"));
//			em.setEmail(rs.getString("email"));
//			em.setOfficeCode(rs.getString("officeCode"));
//			em.setReportsTo(rs.getInt("reportsTo"));
//			em.setJobTitle(rs.getString("jobTitle"));
//			list.add(em);
//		}
//	}catch (SQLException e) {
//		// TODO Auto-generated catch block
//		e.printStackTrace();
//		System.out.println("SQL ERROR" + e.getMessage());
//	}
//	return list;
//}

//显示员工信息
public static List<Employees> showEmployee(String jT) {

	List<Employees> list=new ArrayList<Employees>();//创建list集合，用于保持User对象
	
	try {
		Connection cnn = getConnection();
		String sql = "select * from employees where jobTitle=?";
		PreparedStatement cmd = cnn.prepareStatement(sql);
		cmd.setString(1, jT);
		ResultSet rs = cmd.executeQuery();
		
		while(rs.next()){
		Employees em=new Employees();//创建User对象用于保持从数据看查出来的数据
		em.setEmployeeNumber(rs.getInt(1));
		em.setLastName(rs.getString(2));
		em.setFirstName(rs.getString(3));
		em.setExtension(rs.getString(4));
		em.setEmail(rs.getString(5));
		em.setOfficeCode(rs.getString(6));
		em.setReportsTo(rs.getInt(7));
		em.setJobTitle(rs.getString(8));
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
//显示所有员工信息
public static List<Employees> showAllEmployee() {
	List<Employees> list=new ArrayList<Employees>();//创建list集合，用于保持User对象
	try {
		Connection cnn = getConnection();
		String sql = "select * from employees";
		PreparedStatement cmd = cnn.prepareStatement(sql);
		ResultSet rs = cmd.executeQuery();
		while(rs.next()){
		Employees em=new Employees();//创建User对象用于保持从数据看查出来的数据
		em.setEmployeeNumber(rs.getInt(1));
		em.setLastName(rs.getString(2));
		em.setFirstName(rs.getString(3));
		em.setExtension(rs.getString(4));
		em.setEmail(rs.getString(5));
		em.setOfficeCode(rs.getString(6));
		em.setReportsTo(rs.getInt(7));
		em.setJobTitle(rs.getString(8));
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
//获取当前表中的总数量
		public static int findCount() {
			int num = 0;
			try {
				Connection cnn = getConnection();
				Statement cmd = cnn.createStatement();
				String sql = "select count(*) from employees";
				ResultSet rs = cmd.executeQuery(sql);
				while(rs.next()) {
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
//查询所有用户的信息					当前显示的页码
	public static List<Employees> getAllEmployees(int reportTo) {
		List<Employees> list = new ArrayList<Employees>();
			try {
				Connection cnn = getConnection();
				//Statement cmd = cnn.createStatement();
				String sql = "select * from employees where reportsTo=?";
				PreparedStatement cmd = cnn.prepareStatement(sql);
				//第一个参数，设置返回的起始的索引号.第二个参数，从起点索引返回的条数
				cmd.setInt(1, reportTo);
				ResultSet rs = cmd.executeQuery();
				// 对数据的长度进行循环获取
				while (rs.next()) {
					// 对表的列进行获取对应的列的值
					Employees em = new Employees();
					em.setEmployeeNumber(rs.getInt(1));
					em.setLastName(rs.getString(2));
					em.setLastName(rs.getString(3));
					em.setExtension(rs.getString(4));
					em.setEmail(rs.getString(5));
					em.setOfficeCode(rs.getString(6));
					em.setReportsTo(rs.getInt(7));
					em.setJobTitle(rs.getString(8));
					list.add(em);
				}
				cnn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				System.out.println("SQL问题：" + e.getMessage());
			}
			return list;
		}
	public static List<Employees> getAll(int page) {
		List<Employees> list = new ArrayList<Employees>();
			try {
				Connection cnn = getConnection();
				//Statement cmd = cnn.createStatement();
				String sql = "select * from employees limit ?,?";
				PreparedStatement cmd = cnn.prepareStatement(sql);
				cmd.setInt(1,(page-1)*Employees.PAGE_SIZE);
				cmd.setInt(2, Employees.PAGE_SIZE);
				ResultSet rs = cmd.executeQuery();
				// 对数据的长度进行循环获取
				while (rs.next()) {
					// 对表的列进行获取对应的列的值
					Employees em = new Employees();
					em.setEmployeeNumber(rs.getInt(1));
					em.setLastName(rs.getString(2));
					em.setLastName(rs.getString(3));
					em.setExtension(rs.getString(4));
					em.setEmail(rs.getString(5));
					em.setOfficeCode(rs.getString(6));
					em.setReportsTo(rs.getInt(7));
					em.setJobTitle(rs.getString(8));
					list.add(em);
				}
				cnn.close();
				//System.out.println("list"+list);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				System.out.println("SQL问题：" + e.getMessage());
			}
			return list;
		}
	public static List<Employees> getAll(int page,String jobT) {
		List<Employees> list = new ArrayList<Employees>();
			try {
				Connection cnn = getConnection();
				//Statement cmd = cnn.createStatement();
				String sql = "select * from employees where jobTitle=? limit ?,?";
				PreparedStatement cmd = cnn.prepareStatement(sql);
				cmd.setString(1, jobT);
				cmd.setInt(2,(page-1)*Employees.PAGE_SIZE);
				cmd.setInt(3, Employees.PAGE_SIZE);
				ResultSet rs = cmd.executeQuery();
				// 对数据的长度进行循环获取
				while (rs.next()) {
					// 对表的列进行获取对应的列的值
					Employees em = new Employees();
					em.setEmployeeNumber(rs.getInt(1));
					em.setLastName(rs.getString(2));
					em.setFirstName(rs.getString(3));
					em.setExtension(rs.getString(4));
					em.setEmail(rs.getString(5));
					em.setOfficeCode(rs.getString(6));
					em.setReportsTo(rs.getInt(7));
					em.setJobTitle(rs.getString(8));
					list.add(em);
				}
				cnn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				System.out.println("SQL问题：" + e.getMessage());
			}
			return list;
		}





public static List<Employees> searchInfoE(String keyword){
	List <Employees> list= new ArrayList<Employees>();
	try {
		Connection cnn = getConnection();
		String sql = "select * from employees where employeeNumber like %keyword% or lastName like %keyword% or firstName like %keyword% or extension like %keyword% "
				+ "or email like %keyword%  or officeCode like %keyword%  or reportsTo like %keyword% or jobTitle like %keyword% ";
		PreparedStatement cmd = cnn.prepareStatement(sql);
		cmd.setString(1,keyword);
		ResultSet rs = cmd.executeQuery();
		while(rs.next()){
		Employees em=new Employees();//����User�������ڱ��ִ����ݿ������������
		em.setEmployeeNumber(rs.getInt("employeesNumber"));
		em.setLastName(rs.getString("lastName"));
		em.setFirstName(rs.getString("firstName"));
		em.setExtension(rs.getString("extension"));
		em.setEmail(rs.getString("email"));
		em.setOfficeCode(rs.getString("officeCode"));
		em.setReportsTo(rs.getInt("reportsTo"));
		em.setJobTitle(rs.getString("jobTitle"));
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


public static boolean delEmployee(Employees cus) {	
	boolean flag = false;
	try {
		Connection cnn = getConnection();
		Statement cmd = cnn.createStatement();
		String sql ="delete from employees where employeesNumber="+cus.getEmployeeNumber();
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

public static boolean addEmployee(Employees cus) {
	boolean flag = false;
try {
	Connection cnn = getConnection();
	Statement cmd = cnn.createStatement();
	String sql = "insert into employees(employeeNumber,LastName,FirstName,"
			+ "extension,email,officeCode,reports To,JobTitle,"
			+ "postalCode, country, salesRepEmployeeNumber, creditLimit) values(" + cus.getEmployeeNumber() + "','" + cus.getLastName() + "','" + cus.getFirstName() + "','"
			+ cus.getEmail() + "','" + cus.getOfficeCode() + "','" + cus.getReportsTo() + "','" + cus.getJobTitle()+ ")";
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

//员工修改邮箱
public static boolean changeEmail(Employees em) {
	boolean flag = false;
	try {
		Connection cnn = getConnection();
		String sql = "update employees set email=? where employeeNumber=?";
		PreparedStatement cmd = cnn.prepareStatement(sql);
		cmd.setString(1,em.getEmail());
		cmd.setInt(2, em.getEmployeeNumber());
		int num = cmd.executeUpdate();
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



















}








