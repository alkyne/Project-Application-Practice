<%@ page contentType="text/html;charset=utf-8"%>
<%@ page import="java.security.*" %>
<%@include file="db.jsp"%>
<!doctype html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<link rel="stylesheet" href="css/reset.css">
<link rel="stylesheet" href="css/bootstrap.min.css">
<title>로그인</title>

</head>
<body>

<%
	String action = request.getParameter("action");
	String salt = "dongmin";
	
	if (action == null)
		action = "";

	if (action.equals("login")) {
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		String sql = "select name, pw from users where id=? limit 1";

		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, request.getParameter("id"));
		rs = pstmt.executeQuery();
		
		String db_pw = "";
		String db_name = "";
		if(rs.next()) {
			db_pw = rs.getString("pw");
			db_name = rs.getString("name");
		}
		
		else {
			out.print("<script>");
			out.print("alert('로그인 실패. 정보를 다시 확인하세요.');");
			out.print("location.href='signin.jsp';");
			out.print("</script>");
		}
		
		// hashing pw
		MessageDigest sha1 = MessageDigest.getInstance("SHA1");
		byte[] bytedata = pw.getBytes();
		sha1.update(bytedata);
		byte[] digest = sha1.digest();
		
		String sha1_data = "";
	    for(int i =0;i<digest.length;i++) {
	    	sha1_data = sha1_data + Integer.toHexString(digest[i] & 0xFF);
	    }

	    // double hashing with salt !!
	    String second_hashing = sha1_data + salt;
	    bytedata = (second_hashing).getBytes();
	    sha1.update(bytedata);
	    digest = sha1.digest();
	    sha1_data = "";
	    for(int i =0;i<digest.length;i++) {
	    	sha1_data = sha1_data + Integer.toHexString(digest[i] & 0xFF);
	    }
	    
	    if(db_pw.equals(sha1_data)) {
	    	out.print("<script>");
			out.print("alert('"+id+"님 안녕하세요');");
			out.print("</script>");
			session.setAttribute("id", id);
			session.setAttribute("name", db_name);
			response.sendRedirect("index.jsp"); 
	    }
	    
	    else {
	    	out.print("<script>");
			out.print("alert('로그인 실패. 정보를 다시 확인하세요.');");
			out.print("location.href='signin.jsp';");
			out.print("</script>");
	    }
	}

	%>

	<form class="container container-fluid"
		style="padding: 80px; width: 600px;" action="signin.jsp" method="post">

		<h2 class="text-center">여행지 추천 서비스</h2>
		<fieldset>

			<legend>로그인</legend>

			<div class="form-group col">
				<label>아이디</label> <input type="text" class="form-control"
					placeholder="아이디를 입력해주세요" name="id">
			</div>


			<div class="form-group col">
				<label>Password</label> <input type="password" class="form-control"
					placeholder="패스워드를 입력해주세요" name="pw">
			</div>
			<input type="hidden" name="action" value="login">

			<div class="col">
				<button type="submit" class="btn btn-primary" id="join">로그인</button>
				<button type="reset" class="btn btn-primary">초기화</button>
				<button type="button" class="btn btn-link"
					onclick="location.href='index.jsp'">뒤로 가기</button>
			</div>
		</fieldset>
	</form>

	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
		integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js"
		integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh"
		crossorigin="anonymous"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"
		integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1"
		crossorigin="anonymous"></script>
	<script>
		$(document).ready(function() {
			$('#join').click(function() {
				$('.alert').show()
			})
		});
	</script>

</body>
</html>
