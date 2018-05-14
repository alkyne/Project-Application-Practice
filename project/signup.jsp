<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ page import="java.security.*"%>
<%@include file="db.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<link rel="stylesheet" href="css/reset.css">
<link rel="stylesheet" href="css/bootstrap.min.css">

<title>회원가입</title>
</head>
<body>

	<%!
	
	String double_hashing(String pw) {

		String salt = "dongmin";
		String sha1_data = "";

		try {
			// hashing pw
			MessageDigest sha1 = MessageDigest.getInstance("SHA1");
			byte[] bytedata = pw.getBytes();
			sha1.update(bytedata);
			byte[] digest = sha1.digest();

			for (int i = 0; i < digest.length; i++) {
				sha1_data = sha1_data + Integer.toHexString(digest[i] & 0xFF);
			}

			// double hashing with salt !!
			String second_hashing = sha1_data + salt;
			bytedata = (second_hashing).getBytes();
			sha1.update(bytedata);
			digest = sha1.digest();
			sha1_data = "";
			for (int i = 0; i < digest.length; i++) {
				sha1_data = sha1_data + Integer.toHexString(digest[i] & 0xFF);
			}

		} catch (NoSuchAlgorithmException e) {
			System.err.println("fail to make hash (no sha1)");
		}

		return sha1_data;

	} // end function

	boolean checkIdExist(String id) {

		try {
			connect();
			String sql = "select count(*) from users where id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			int count = 0;
			if(rs.next()) {
				count = rs.getInt(1);
			}
			// id already exists
			if (count > 0)
				return true;

			else
				return false;

		} // end try

		catch (Exception e) {
			System.out.print(e.getMessage());
			return true;
		}

		finally {
			disconnect();
		}
	} // end function
	
	%>

	<%
		request.setCharacterEncoding("UTF-8");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String introduce = request.getParameter("introduce");
		
		if(name == null )
			name = "";
		if(email == null )
			email = "";
		if(introduce == null )
			introduce = "";
		
		try {

			String action = request.getParameter("action");

			if (action == null)
				action = "";

			if (action.equals("join")) {

				String id = request.getParameter("id");
				boolean exist = checkIdExist(id);

				if (exist) {
					out.print("<script>");
					out.print("alert('이미 존재하는 아이디입니다.');");
					//out.print("location.href='signup.jsp';");
					out.print("</script>");
					//return;
				}

				else {
				connect();
				String sql = "insert into users (id, pw, name, email, introduce) values(?,?,?,?,?)";

				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, request.getParameter("id"));
				pstmt.setString(2, double_hashing(request.getParameter("pw")));
				pstmt.setString(3, name);
				pstmt.setString(4, email);
				pstmt.setString(5, introduce);
				pstmt.executeUpdate();

				out.print("<script>");
				//out.print("alert('"+name+"');");
				out.print("alert('회원가입 완료되었습니다.');");
				out.print("location.href='index.jsp';");
				out.print("</script>");

				session.setAttribute("id", id);
				session.setAttribute("name", name);
				}// end else
			}
		} // end try
		catch (Exception e) {
			out.print(e.getMessage());
		}

		finally {
			disconnect();
		}
	%>

	<form class="container container-fluid" style="padding: 80px; width: 700px" action="signup.jsp" method="post">

		<h2 class="text-center">여행지 추천 서비스</h2>
		<fieldset>

			<legend>회원가입</legend>

			<div class="form-group col">
				<label>아이디</label> <input type="text" class="form-control" placeholder="아이디를 입력해주세요" name="id" required>
			</div>


			<div class="form-group col">
				<label>패스워드</label> <input type="password" class="form-control" placeholder="패스워드를 입력해주세요" name="pw" required>
			</div>


			<div class="form-group col">
				<label>이름</label> <input type="text" class="form-control" placeholder="이름을 입력해주세요" name="name" value="<%= name %>" required>
			</div>

			<div class="form-group col">
				<label>이메일</label> <input type="email" class="form-control" placeholder="이메일을 입력해주세요" name="email" value="<%= email %>" required>
			</div>


			<div class="form-group col">
				<label>선호 여행지는?</label>
				<div class="form-check">
					<label class="form-check-label"> <input class="form-check-input" type="checkbox" value="domestic"> 국내
					</label> <br> <label class="form-check-label"> <input class="form-check-input" type="checkbox" value="asia"> 아시아
					</label> <br> <label class="form-check-label"> <input class="form-check-input" type="checkbox" value="europe"> 유럽
					</label> <br> <label class="form-check-label"> <input class="form-check-input" type="checkbox" value="america"> 미주/중남미
					</label> <br> <label class="form-check-label"> <input class="form-check-input" type="checkbox" value="africa"> 아프리카
					</label> <br> <label class="form-check-label"> <input class="form-check-input" type="checkbox" value="space"> 우주
					</label><br>
				</div>

			</div>

			<div class="form-group col">
				<label for="exampleTextarea">자기소개</label>
				<textarea class="form-control" id="exampleTextarea" rows="4" name="introduce" placeholder="자기소개를 써주세요" required><%= introduce %></textarea>
			</div>
			<div class="col">
				<button type="submit" class="btn btn-primary" id="join">가입하기</button>
				<button type="reset" class="btn btn-primary">초기화</button>
				<button type="button" class="btn btn-link" onclick="location.href='index.jsp'">뒤로 가기</button>
			</div>
			<input type="hidden" name="action" value="join">

		</fieldset>
	</form>

	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js" integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js" integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1" crossorigin="anonymous"></script>

</body>
</html>
