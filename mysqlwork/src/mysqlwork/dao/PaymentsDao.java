package mysqlwork.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import mysqlwork.model.Payments;

public class PaymentsDao {
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
	 public static List<Payments> showAllPayments() {
	List<Payments> list=new ArrayList<Payments>() ;
	
	try {
		Connection cnn = getConnection();
		String sql = "select * from payments";
		PreparedStatement cmd = cnn.prepareStatement(sql);
		ResultSet rs = cmd.executeQuery();
		
		while(rs.next()){
		Payments em=new Payments();
		em.setCustomerNumber(rs.getInt(1));
		em.setCheckNumber(rs.getString(2));;
		em.setPaymentDate(rs.getString(3));
		em.setAmount(rs.getString(4));
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
	 public static List<Payments> searchPayments(Payments pay) {
			List<Payments> list=new ArrayList<Payments>() ;
			try {
				Connection cnn = getConnection();
				String sql = "select * from payments where customerNumber=?";
				PreparedStatement cmd = cnn.prepareStatement(sql);
				cmd.setInt(1, pay.getCustomerNumber());
				ResultSet rs = cmd.executeQuery();
				
				while(rs.next()){
				Payments em=new Payments();
				em.setCustomerNumber(rs.getInt(1));
				em.setCheckNumber(rs.getString(2));;
				em.setPaymentDate(rs.getString(3));
				em.setAmount(rs.getString(4));
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
				String sql = "select count(*) from payments";
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
		
		public static List<Payments> getAllPayments(int CustomerNumber) {
			List<Payments> list = new ArrayList<Payments>();
				try {
					Connection cnn = getConnection();
					//Statement cmd = cnn.createStatement();
					String sql = "select * from payments where CustomerNumber=? limit ?,?";
					PreparedStatement cmd = cnn.prepareStatement(sql);
					
					cmd.setInt(1, CustomerNumber);
					ResultSet rs = cmd.executeQuery();
					
					while(rs.next()){
						Payments em=new Payments();
						
						em.setCustomerNumber(rs.getInt(1));
						em.setCheckNumber(rs.getString(2));;
						em.setPaymentDate(rs.getString(3));
						em.setAmount(rs.getString(4));
						list.add(em);
					
					}
				
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
					System.out.println("SQL ����" + e.getMessage());
				}
				return list;
			}
	
		
		public static boolean delPayments(Payments cus) {	
			boolean flag = false;
			try {
				Connection cnn = getConnection();
				Statement cmd = cnn.createStatement();
				String sql ="delete from payments where CustomerNumber="+cus.getCustomerNumber();
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
		
		public static List<Payments> getAll(int page) {
			List<Payments> list = new ArrayList<Payments>();
			try {
				Connection cnn = getConnection();
				//Statement cmd = cnn.createStatement();
				String sql = "select * from payments limit ?,?";
				PreparedStatement cmd = cnn.prepareStatement(sql);
				//��һ�����������÷��ص���ʼ��������.�ڶ���������������������ص�����
				cmd.setInt(1,(page-1)*Payments.PAGE_SIZE);
				cmd.setInt(2, Payments.PAGE_SIZE);
				ResultSet rs = cmd.executeQuery();
				
				// �����ݵĳ��Ƚ���ѭ����ȡ
				while (rs.next()) {
					// �Ա����н��л�ȡ��Ӧ���е�ֵ
					Payments em=new Payments();
					
					em.setCustomerNumber(rs.getInt(1));
					em.setCheckNumber(rs.getString(2));;
					em.setPaymentDate(rs.getString(3));
					em.setAmount(rs.getString(4));
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
	public static boolean addPayments(Payments cus) {
		boolean flag = false;
	try {
		Connection cnn = getConnection();
		Statement cmd = cnn.createStatement();
		String sql = "insert into payments(CustomerNumber,checkNumber, paymentDate,"
				+ "amount) values(" + cus.getCustomerNumber() + "','"
				+ cus.getCheckNumber() + "','" + cus.getPaymentDate() + "','" + cus.getAmount()  + ")";
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
