<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="addrbook_error.jsp" import="java.util.*, jspbook.addrbook.*"%>
<!DOCTYPE HTML>
<html>
<head>
<link rel="stylesheet" href="addrbook.css" type="text/css" media="screen" />

<script type="text/javascript">
	function check(ab_id) {
		pwd = prompt('수정/삭제 하려면 비밀번호를 넣으세요');
		document.location.href="addrbook_control.jsp?action=edit&ab_id="+ab_id+"&upasswd="+pwd;
	}
</script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>주소록:목록화면</title>

</head>
<jsp:useBean id="datas" scope="request" class="java.util.ArrayList" />

<body>
<div align="center"> 
<H2>주소록:목록화면</H2>
<HR>
<form>
<a href="addrbook_form.jsp">주소록 등록</a><P>

		<table border="2">
			<tr><th>번호</th><th>이 름</th><th>전화번호</th><th>생 일</th><th>회 사</th><th>닉네임</th><th>학 번</th><th>취 미</th><th>메 모</th></tr>
			<%
				for(AddrBook  ab : (ArrayList<AddrBook>)datas) {
			%>
			  <tr>
			   <td><a href="javascript:check(<%=ab.getAb_id()%>)"><%=ab.getAb_id() %></a></td>
				<td><%=ab.getAb_name() %></td>
				<td><%=ab.getAb_tel() %></td>
				<td><%=ab.getAb_birth() %></td>
				<td><%=ab.getAb_comdept() %></td>
				
				<td><%=ab.getAb_nickname() %></td>
				<td><%=ab.getAb_hakbun() %></td>
				<td><%=ab.getAb_hobby() %></td>
				<td><%=ab.getAb_memo() %></td>
				
			  </tr>
			 <%
				}
			 %>
		</table>
</form>

</div>
</body>
</html>