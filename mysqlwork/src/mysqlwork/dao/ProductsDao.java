package mysqlwork.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import mysqlwork.model.Products;

public class ProductsDao {
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

	public static List<Products> showAllProduct() {

		List<Products> list = new ArrayList<Products>();

		try {
			Connection cnn = getConnection();
			String sql = "select * from products";
			PreparedStatement cmd = cnn.prepareStatement(sql);
			ResultSet rs = cmd.executeQuery();

			while (rs.next()) {
				Products em = new Products();

				em.setProductCode(rs.getString(1));
				em.setProductName(rs.getString(2));
				em.setProductLine(rs.getString(3));
				em.setProductScale(rs.getString(4));
				em.setProductVendor(rs.getString(5));
				em.setProductDescription(rs.getString(6));
				em.setQuantityInStock(rs.getString(7));
				em.setBuyPrice(rs.getString(8));
				em.setMSRP(rs.getString(9));

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
	//查询产品是否存在
	public static boolean searchProduct(Products p) {
		boolean flag = false;
		try {
			Connection cnn = getConnection();
			String sql = "select count(*) from products where productCode=?";
			PreparedStatement cmd = cnn.prepareStatement(sql);
			cmd.setString(1, p.getProductCode());
			ResultSet rs = cmd.executeQuery();
			if(rs.next()) {
				int num = rs.getInt(1);
				if(num > 0) {
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
	//查询产品信息
	public static List<Products> searchProductByNumber(Products p) {
		List<Products> list = new ArrayList<Products>();
		try {
			Connection cnn = getConnection();
			String sql = "select * from products where productCode=?";
			PreparedStatement cmd = cnn.prepareStatement(sql);
			cmd.setString(1, p.getProductCode());
			ResultSet rs = cmd.executeQuery();
			while (rs.next()) {
				Products em = new Products();

				em.setProductCode(rs.getString(1));
				em.setProductName(rs.getString(2));
				em.setProductLine(rs.getString(3));
				em.setProductScale(rs.getString(4));
				em.setProductVendor(rs.getString(5));
				//em.setProductDescription(rs.getString(6));
				em.setQuantityInStock(rs.getString(7));
				em.setBuyPrice(rs.getString(8));
				em.setMSRP(rs.getString(9));

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
	//查询产品线名称
			public static String searchProductLineNameByNumber(Products p) {
				String productLineName = null;
				try {
					Connection cnn = getConnection();
					String sql = "select * from products where productCode=\'S10_1678\'";
					//System.out.print(sql);
					PreparedStatement cmd = cnn.prepareStatement(sql);
					//cmd.setString(1, p.getProductCode());
					//System.out.print("num");
					ResultSet rs = cmd.executeQuery();
					if(rs.next()) {
						int num = rs.getInt(1);
						if(num > 0) {
							productLineName = p.getProductLine();
							//System.out.print(productLineName);
	 					}
					}
					cnn.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
					System.out.println("SQL ERROR" + e.getMessage());
				}
				return productLineName;
			}

	//查询产品线
		public static String searchProductDescriptionByName(String pln) {
			String productDescription = null;
			try {
				Connection cnn = getConnection();
				String sql = "select * from products where productLine=?";
				PreparedStatement cmd = cnn.prepareStatement(sql);
				cmd.setString(1, pln);
				ResultSet rs = cmd.executeQuery();
				if(rs.next()) {
					int num = rs.getInt(1);
					System.out.print(num);
					if(num > 0) {
						Products p = new Products();
						productDescription = p.getProductDescription();
						System.out.print(productDescription);
 					}
				}
				cnn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				System.out.println("SQL ERROR" + e.getMessage());
			}
			return productDescription;
		}
		public static int findCount() {
			int num = 0;
			try {
				Connection cnn = getConnection();
				Statement cmd = cnn.createStatement();
				String sql = "select count(*) from products";
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
		
		public static List<Products> getAllProducts(int productCode) {
			List<Products> list = new ArrayList<Products>();
				try {
					Connection cnn = getConnection();
					//Statement cmd = cnn.createStatement();
					String sql = "select * from products where productCode=? ";
					PreparedStatement cmd = cnn.prepareStatement(sql);
					
					cmd.setInt(1, productCode);
					ResultSet rs = cmd.executeQuery();
					
					while(rs.next()){
						Products em=new Products();
						
						em.setProductCode(rs.getString(1));
						em.setProductName(rs.getString(2));
						em.setProductLine(rs.getString(3));
						em.setProductScale(rs.getString(4));
						em.setProductVendor(rs.getString(5));
						em.setProductDescription(rs.getString(6));
						em.setQuantityInStock(rs.getString(7));
						em.setBuyPrice(rs.getString(8));
						em.setMSRP(rs.getString(9));
						list.add(em);
					}
					
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
					System.out.println("SQL����:" + e.getMessage());
				}
				return list;
			}
		
		public static boolean delProduct(Products cus) {	
			boolean flag = false;
			try {
				Connection cnn = getConnection();
				Statement cmd = cnn.createStatement();
				String sql ="delete from products where productCode="+cus.getProductCode();
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

		public static List<Products> getAll(int page) {
			List<Products> list = new ArrayList<Products>();
			try {
				Connection cnn = getConnection();
				//Statement cmd = cnn.createStatement();
				String sql = "select * from products limit ?,?";
				PreparedStatement cmd = cnn.prepareStatement(sql);
				//��һ�����������÷��ص���ʼ��������.�ڶ���������������������ص�����
				cmd.setInt(1,(page-1)*Products.PAGE_SIZE);
				cmd.setInt(2, Products.PAGE_SIZE);
				ResultSet rs = cmd.executeQuery();
				
				// �����ݵĳ��Ƚ���ѭ����ȡ
				while (rs.next()) {
					// �Ա����н��л�ȡ��Ӧ���е�ֵ
					Products em=new Products();
					
					em.setProductCode(rs.getString(1));
					em.setProductName(rs.getString(2));
					em.setProductLine(rs.getString(3));
					em.setProductScale(rs.getString(4));
					em.setProductVendor(rs.getString(5));
					em.setProductDescription(rs.getString(6));
					em.setQuantityInStock(rs.getString(7));
					em.setBuyPrice(rs.getString(8));
					em.setMSRP(rs.getString(9));
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
		public static boolean addProducts(Products cus) {
		boolean flag = false;
		try {
		Connection cnn = getConnection();
		Statement cmd = cnn.createStatement();
		String sql = "insert into products(productCode,productName, productLine,productScale,"
				+ "productVender,productDescription,quantityStock,buyPrice,MSRP) values(" + cus.getProductCode() + "','"
				+ cus.getProductName() + "','" + cus.getProductLine() + "','" + cus.getProductScale() + "','" 
				+ cus.getProductVendor() + "','" + cus.getProductDescription() + "','" + cus.getQuantityInStock()+
				"','" + cus.getBuyPrice() + "','" + cus.getMSRP()+ ")";
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