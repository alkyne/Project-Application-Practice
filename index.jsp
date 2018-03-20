<%@ page contentType="text/html;charset=utf-8"%> 
<%@ page import="java.util.*, java.text.*"  %>

<%
	java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
 	String today = formatter.format(new java.util.Date());
%>
<head> <title> 전문프로젝트 </title> </head>

<h3>hello jsp</h3>
<h3> 전문프로젝트 JSP </h3>

<%= today %>
