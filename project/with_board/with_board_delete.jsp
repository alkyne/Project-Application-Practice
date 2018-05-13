<%@ page contentType="text/html;charset=utf-8"%>
<%@include file="../db.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>게시글 삭제</title>
<link rel="stylesheet" href="../css/reset.css">
<link rel="stylesheet" href="../css/bootstrap.min.css">
</head>
<body>
	<%
	
	try {
		connect();
		String pw_param = request.getParameter("pw");
		String no = request.getParameter("no");
		if (no == null || no=="") {
			out.println("no param");
			return;
		}

		if (pw_param == null || pw_param == "") {
	%>
	<div class="container container-fluid" style="padding: 80px; width: 700px">
		<form action="./with_board_delete.jsp?no=<%=no%>" method="post">
			<fieldset>
				<legend>패스워드를 입력하세요</legend>

				<div class="form-group">
					<label>패스워드</label> <input type="password" name="pw" class="form-control" placeholder="패스워드">
				</div>

				<button type="submit" class="btn btn-primary">삭제</button>
				<button type="button" class="btn btn-link" onclick="location.href='./index.jsp'">뒤로가기</button>
			</fieldset>
		</form>
	</div>
	<%
		} 
		
		else {

			String sql = "select pw from with_board where no=?";

			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, no);

			String pw = null;
			rs = pstmt.executeQuery(); // get password from db
			if (rs.next()) {
				pw = rs.getString("pw");
				//out.print("<script>alert('param : "+ pw_param + "');</script>");
				//out.print("<script>alert('db pw : " + pw + "');</script>");
				
			}

			// no board num
			if (pw == null) {
				out.println("no board no");
				return;
			}

			if (pw.equals(pw_param)) {

				sql = "delete from with_board where no=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, no);
				pstmt.executeUpdate();

				out.print("<script>");
				out.print("alert('삭제되었습니다.');");
				out.print("location.href='index.jsp';");
				out.print("</script>");
			}

			else {
				out.print("<script>");
				out.print("alert('패스워드가 맞지 않습니다.');");
				out.print("location.href='index.jsp';");
				out.print("</script>");
			}
		} // else
			
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
