package mysqlwork.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import mysqlwork.model.Offices;

public class OfficesDao {
	public static List<Offices> showAllOffices() {

		List<Offices> list=new ArrayList<Offices>();//����list���ϣ����ڱ���User����
	
		try {
			
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			String dburl = "jdbc:mysql://127.0.0.1:3306/new?useUnicode=true&characterEncoding=utf-8";
			String dbuser="root";
			String dbpwd="123";
			Connection cnn = DriverManager.getConnection(dburl, dbuser, dbpwd);
			String sql ="select * from offices";
			PreparedStatement cmd = cnn.prepareStatement(sql);
			ResultSet rs = cmd.executeQuery();
			
			while(rs.next()){
			Offices em=new Offices();//����User�������ڱ��ִ����ݿ������������
			em.setOfficescode(rs.getInt(1));
			em.setCity(rs.getString(2));
			em.setPhone(rs.getString(3));
			em.setAddressline1(rs.getString(4));
			em.setState(rs.getString(5));
			em.setCountry(rs.getString(6));
			em.setPostalcode(rs.getString(7));
			em.setTerritory(rs.getString(8));
			
			
			list.add(em);
			}
			cnn.close();
		
		}catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("SQL ERROR" + e.getMessage());
		}
		return list;
	
}	
}
