<%@ page contentType="text/html;charset=utf-8"%>
<%@include file="../db.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>동행자 게시판</title>
    <link rel="stylesheet" href="../css/reset.css">
    <link rel="stylesheet" href="../css/bootstrap.min.css">
</head>
<body>


<div class="container container-fluid" style="padding:80px; width:700px">

    <h2 class="text-center">동행자 게시판</h2>
    <table class="table table-hover text-center">
        <thead>
        <tr>
            <th scope="col">순번</th>
            <th scope="col">글쓴이</th>
            <th scope="col">제목</th>
            <th scope="col">날짜</th>
        </tr>
        </thead>
        <tbody>


<%
String sql = "select * from with_board;";
pstmt = con.prepareStatement(sql);
rs = pstmt.executeQuery();
while(rs.next()){

	String no = rs.getString("no");
	String name = rs.getString("name");
	String title = rs.getString("title");
	String content = rs.getString("content");
	Timestamp date = rs.getTimestamp("date");
%>
        
	       <tr>
	           <td><%=no %></td>
	           <td><%=name %></td>
	           <td><a href="with_board_view.jsp?no=<%=no %>"><%=title %></a></td>
	           <td><%=date %></td>
	       </tr>
        
        <%
} // while
        %>

        </tbody>
    </table>
    <div class="col">
        <a href="with_board_insert.jsp"><button type="button" class="btn btn-primary" id="join">글쓰기</button></a>
        <button type="button" class="btn btn-link" onclick="location.href='../index.jsp'">뒤로가기</button>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>
</body>
</html>
