<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>

<%
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	String jdbc_driver = "com.mysql.jdbc.Driver";
	String jdbc_url = "jdbc:mysql://dongmin2.oa.to:3306/practical_project";

	try {
		Class.forName(jdbc_driver);
		con = DriverManager.getConnection(jdbc_url, "practical", "practical");
		//out.print("Connection Ok da");
	} catch (Exception e) {
		out.print("connect error");
		e.printStackTrace();
	}
%>
