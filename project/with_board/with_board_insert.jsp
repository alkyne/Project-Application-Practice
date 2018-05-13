<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../db.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="UTF-8">
<title>동행자 게시판 글쓰기</title>
<link rel="stylesheet" href="../css/reset.css">
<link rel="stylesheet" href="../css/bootstrap.min.css">
</head>
<body>

	<%	
		try {
			connect();
			request.setCharacterEncoding("UTF-8");
			String action = request.getParameter("action");
	
			if (action == null)
				action = "";
	
			if (action.equals("insert")) {
				connect();
				String sql = "insert into with_board (name, title, content, pw, date) values(?,?,?,?,now())";
	
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, request.getParameter("name"));
				pstmt.setString(2, request.getParameter("title"));
				pstmt.setString(3, request.getParameter("content"));
				pstmt.setString(4, request.getParameter("pw"));
				pstmt.executeUpdate();
				out.print("<script>");
				out.print("alert('글이 등록되었습니다.');");
				out.print("location.href='index.jsp';");
				out.print("</script>");
				return;
			}
		} // end try
		catch (Exception e) {
			out.print(e.getMessage());
		}
		finally {
			disconnect();
		}
	
	%>

	<div class="container container-fluid" style="padding: 80px; width: 700px">
		<form method="post">

			<input type="hidden" name="action" value="insert">
			<fieldset>
				<legend>동행자 게시판 글쓰기</legend>

				<div class="form-group">
					<label>제목</label> <input type="text" name="title" class="form-control" placeholder="제목을 입력하세요" required>
				</div>

				<div class="form-group">
					<label>글쓴이</label> <input type="text" name="name" class="form-control" placeholder="이름을 입력하세요" required>
				</div>

				<div class="form-group">
					<label for="exampleInputPassword1">패스워드</label> <input type="password" class="form-control" name="pw" placeholder="패스워드를 입력하세요" required>
				</div>

				<div class="form-group">
					<label>내용</label>
					<textarea class="form-control" name="content" rows="3" cols="10" required></textarea>
				</div>

			</fieldset>
			<button type="submit" class="btn btn-primary">글쓰기</button>
			<button type="reset" class="btn btn-primary">다시 쓰기</button>
			<button type="button" class="btn btn-link" onclick="location.href='./index.jsp'">뒤로가기</button>
			</fieldset>
	</div>
	</form>

	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>
</body>
</html>
