<%@ page contentType="text/html;charset=utf-8"%>
<%@include file="db.jsp"%>
<!doctype html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<link rel="stylesheet" href="css/reset.css">
<link rel="stylesheet" href="css/bootstrap.min.css">

<title>My Page</title>
</head>
<body>

	<!-- 	<form class="container container-fluid" style="padding: 80px; width: 600px;" action="."> -->

	<div class="container container-fluid" style="padding: 80px; width: 600px; margin-top: 30px;">
		<%
			String id = (String)session.getAttribute("id");
			if(id=="" || id == null) {
		%>

		<div class="alert alert-dismissible alert-warning">
			<button type="button" class="close" data-dismiss="alert">&times;</button>
			<h4 class="alert-heading">오류 !</h4>
			<p class="mb-0">로그인 해주세요.</p>
		</div>

		<div class="col">
			<button type="button" class="btn btn-primary" onclick="location.href='index.jsp'">뒤로 가기</button>
		</div>

		<%
			}
			
			// print my page
			else
			{
				
				try {
					connect();
					String sql = "select * from users where id='"+id+"'";

					pstmt = con.prepareStatement(sql);
					rs = pstmt.executeQuery();
					
					String name = null;
					String email = null;
					String introduce = null;
					
					if (rs.next()) {
						name = rs.getString("name");
						email = rs.getString("email");
						introduce = rs.getString("introduce");
					} // end if

			%>

				<div class="jumbotron">
					<h1 class="display-4"><%=id%></h1>
					<p class="lead"><%=name%></p>
					<p class="lead"><%=email%></p>
					<hr class="my-4">
					<p><%=introduce%></p>
				</div>

					<button type="button" class="btn btn-link" onclick="location.href='./index.jsp'">뒤로가기</button>

			<%
				} // end try
				catch (Exception e) {
					out.print(e.getMessage());
				}
				finally {
					disconnect();
				}
				
			} // end else
			%>
		
	</div>

 <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js" integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js" integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1" crossorigin="anonymous"></script>

</body>
</html>
