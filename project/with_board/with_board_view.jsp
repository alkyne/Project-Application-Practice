<%@ page contentType="text/html;charset=utf-8"%>
<%@include file="../db.jsp"%>
<%@include file="../config.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>동행자 게시판</title>
<link rel="stylesheet" href="../css/reset.css">
<link rel="stylesheet" href="../css/bootstrap.min.css">
</head>
<body>

	<%
		try {
			connect();
			String no = request.getParameter("no");
			String sql = "select * from with_board where no=?";

			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, request.getParameter("no"));

			rs = pstmt.executeQuery();
			String name = null;
			String title = null;
			String content = null;
			String pw = null;
			Timestamp date = null;
			if (rs.next()) {
				name = rs.getString("name");
				title = rs.getString("title");
				content = rs.getString("content");
				pw = rs.getString("pw");
				date = rs.getTimestamp("date");
			} // end if

	%>


	<div class="container container-fluid" style="padding: 80px; width: 700px">

		<div class="jumbotron">
			<h1 class="display-4"><%= htmlspecialchars(title) %></h1>
			<p class="lead"><%= htmlspecialchars(name) %></p>
			<p class="lead"><%=date%></p>
			<hr class="my-4">
			<p><%=content%></p>
		</div>

		<div class="col">
			<a href="./with_board_delete.jsp?no=<%=no%>"><button type="reset" class="btn btn-primary">삭제하기</button></a>
			<button type="button" class="btn btn-link" onclick="location.href='./index.jsp'">뒤로가기</button>
		</div>
	</div>

	<%
		} // end try
		catch (Exception e) {
			out.print(e.getMessage());
		}
		finally {
			disconnect();
		}
	%>
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>
</body>
</html>
