package mysqlwork.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import mysqlwork.model.ProductLine;

public class ProductLineDao {
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

	public static List<ProductLine> showAllProductLine() {
		List<ProductLine> list = new ArrayList<ProductLine>();
		try {
			Connection cnn = getConnection();
			String sql = "select * from productlines";
			PreparedStatement cmd = cnn.prepareStatement(sql);
			ResultSet rs = cmd.executeQuery();

			while (rs.next()) {
				ProductLine em = new ProductLine();

				em.setProductLine(rs.getString(1));
				em.setTextDescription(rs.getString(2));
//			em.setHtmlDescription(rs.getString(3));
//			em.equals(rs.getString(4));
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
	
//	//查询产品线
//	public static List<ProductLine> searchProductLine() {
//		List<ProductLine> list = new ArrayList<ProductLine>();
//		try {
//			Connection cnn = getConnection();
//			String sql = "select * from productlines where ";
//			PreparedStatement cmd = cnn.prepareStatement(sql);
//			ResultSet rs = cmd.executeQuery();
//
//			while (rs.next()) {
//				ProductLine em = new ProductLine();
//
//				em.setProductLine(rs.getString(1));
//				em.setTextDescription(rs.getString(2));
////			em.setHtmlDescription(rs.getString(3));
////			em.equals(rs.getString(4));
//				list.add(em);
//			}
//			cnn.close();
//
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//			System.out.println("SQL ERROR" + e.getMessage());
//		}
//		return list;
//	}
	//查询产品描述
		public static String searchtextDescription(String plN) {
			String tD = null;
			try {
				Connection cnn = getConnection();
				String sql = "select * from productlines where productLine=?";
				PreparedStatement cmd = cnn.prepareStatement(sql);
				cmd.setString(1, plN);
				ResultSet rs = cmd.executeQuery();
				if(rs.next()) {
					int num = rs.getInt(1);
					if(num > 0) {
						ProductLine pl = new ProductLine();
						tD = pl.getTextDescription();
					}
				}
				
				cnn.close();

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				System.out.println("SQL ERROR" + e.getMessage());
			}
			return tD;
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
				System.out.println("SQL ERROR" + e.getMessage());
			}
			return num;
		}

		public static List<ProductLine> getAllProductLine(int productLine) {
			List<ProductLine> list = new ArrayList<ProductLine>();
				try {
					Connection cnn = getConnection();
					//Statement cmd = cnn.createStatement();
					String sql = "select * from productlines where productLine=? limit ?,?";
					PreparedStatement cmd = cnn.prepareStatement(sql);
					
					cmd.setInt(1, productLine);
					ResultSet rs = cmd.executeQuery();
					
					while(rs.next()){
						ProductLine em=new ProductLine();
						
						em.setProductLine(rs.getString(1));
						em.setTextDescription(rs.getString(2));
						em.setHtmlDescription(rs.getString(3));
						em.equals(rs.getString(4));
						list.add(em);
					}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
					System.out.println("SQL ERROR" + e.getMessage());
				}
				return list;
			}

		public static boolean delProductLine(ProductLine cus) {	
			boolean flag = false;
			try {
				Connection cnn = getConnection();
				Statement cmd = cnn.createStatement();
				String sql ="delete from productlines where productLine="+cus.getProductLine();
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

		public static List<ProductLine> getAll(int page) {
			List<ProductLine> list = new ArrayList<ProductLine>();
			try {
				Connection cnn = getConnection();
				//Statement cmd = cnn.createStatement();
				String sql = "select * from productlines limit ?,?";
				PreparedStatement cmd = cnn.prepareStatement(sql);
				cmd.setInt(1,(page-1)*ProductLine.PAGE_SIZE);
				cmd.setInt(2, ProductLine.PAGE_SIZE);
				ResultSet rs = cmd.executeQuery();
				
				while (rs.next()) {
					
					ProductLine em=new ProductLine();
					
					em.setProductLine(rs.getString(1));
					em.setTextDescription(rs.getString(2));
					em.setHtmlDescription(rs.getString(3));
					em.equals(rs.getString(4));
					list.add(em);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				System.out.println("SQL ERROR" + e.getMessage());
			}
			return list;
		}
		public static boolean addProductLine(ProductLine cus) {
		boolean flag = false;
		try {
		Connection cnn = getConnection();
		Statement cmd = cnn.createStatement();
		String sql = "insert into productlines(productLine,textDescription, htmlDescription,"
				+ "image) values(" + cus.getProductLine() + "','"
				+ cus.getTextDescription() + "','" + cus.getHtmlDescription() + "','" + cus.getImage()  + ")";
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

