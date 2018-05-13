<!-- 
    전문프로젝트
    Date        : 2018/05/10
    Professor   : 강재구 교수님
    Written by 9조 전희지 강경민 최동민
-->
<%@ page contentType="text/html;charset=utf-8"%>
<!doctype html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>여행지 정보 공유 사이트</title>

<link rel="stylesheet" href="css/reset.css">
<link rel="stylesheet" href="css/bootstrap.min.css">

<style>
#username {
	color: white;
	margin-top: 7px;
}
</style>

</head>
<body>
<%@include file="db.jsp"%>
<%
try {
	disconnect();
}
finally {};
%>

	<div class="container container-fluid">
		<div class="row" style="background-color: #78C2AD;">
			<div class="col-4" style="display: inline">
				<span id="typed2"></span>
			</div>
			<div class="col-8" style="display: inline;">
				<nav class="navbar navbar-expand-lg navbar-dark bg-primary">

					<!--<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarColor01" aria-controls="navbarColor01" aria-expanded="false" aria-label="Toggle navigation">-->
					<!--<span class="navbar-toggler-icon"></span>-->
					<!--</button>-->
					<div class="collapse navbar-collapse justify-content-end" id="navbarColor01">
						<ul class="navbar-nav">
							<%
							String name = "";
							name = (String)session.getAttribute("name");

							if (name == null || name.equals("")) {
							%>
							<li class="nav-item active"><a class="nav-link" href="signin.jsp">로그인</a></li>
							<li class="nav-item active"><a class="nav-link" href="signup.jsp">회원가입</a></li>
							<%
							} // end if 
							
							else {
								
								out.print("<p id='username'>"+name+"님 환영합니다.</p>");

							}
						%>
							<li class="nav-item active"><a class="nav-link" href="mypage.jsp">MyPage</a></li>
							<li class="nav-item active"><a class="nav-link" href="sitemap.jsp">사이트맵</a></li>

							<form class="form-inline my-2 my-lg-0" action="#">
								<input class="form-control mr-sm-2" type="text" placeholder="검색">
								<button class="btn btn-secondary my-2 my-sm-0" id="search" type="submit">검색</button>

							</form>

						<%
						// if logged in, show logout link
						if(name != null && !name.equals("")) {
						%>
							<li class="nav-item active"><a class="nav-link" href="logout.jsp">로그아웃</a></li>

						<%
						} // end if
						%>
						</ul>
					</div>

				</nav>
				<div class="row">
					<div class="col-7"></div>
					<div class="col-5">
						<div class="alert alert-dismissible alert-warning pull-right" style="display: none">
							<button type="button" class="close" data-dismiss="alert">&times;</button>
							<h4 class="alert-heading"></h4>
							<p class="mb-lg-0">검색 결과가 없습니다 !</p>
						</div>
					</div>
					<!--<div class="col-1"></div>-->
				</div>
			</div>

		</div>

	</div>

	<br>
	<div class="container container-fluid" style="margin: auto">
		<hr>

		<nav class="nav nav-pills nav-fill">
			<span style="width: 60px;"></span> <a href="with_board/index.jsp"><button type="button" class="btn btn-primary">동행 게시판</button></a> <span style="width: 85px;"></span> <span class="dropdown">
				<button class="btn btn-lg btn-primary dropdown-toggle" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">아시아</button>
				<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
					<a class="dropdown-item" href="#">중국</a> <a class="dropdown-item" href="#">일본</a> <a class="dropdown-item" href="#">베트남</a> <a class="dropdown-item" href="#">필리핀</a> <a class="dropdown-item" href="#">태국</a>
				</div>
			</span> <span style="width: 85px;"></span> <span class="dropdown">
				<button class="btn btn-lg btn-primary dropdown-toggle" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">유럽</button>
				<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
					<a class="dropdown-item" href="#">영국</a> <a class="dropdown-item" href="#">북유럽</a> <a class="dropdown-item" href="#">남유럽</a> <a class="dropdown-item" href="#">동유럽</a> <a class="dropdown-item" href="#">서유럽</a>
				</div>
			</span> <span style="width: 85px;"></span> <span class="dropdown">
				<button class="btn btn-lg btn-primary dropdown-toggle" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">미주/중남미</button>
				<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
					<a class="dropdown-item" href="#">미국</a> <a class="dropdown-item" href="#">브라질/아르헨티나/칠레</a> <a class="dropdown-item" href="#">캐나다</a>
				</div>
			</span> <span style="width: 85px;"></span> <span class="dropdown">
				<button class="btn btn-lg btn-primary dropdown-toggle" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">오세아니아</button>
				<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
					<a class="dropdown-item" href="#">오스트레일리아</a> <a class="dropdown-item" href="#">뉴질랜드</a>
				</div>
			</span> <span style="width: 30px"></span>

		</nav>

		<hr>
		<br>
		<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel" style="margin: auto">
			<ol class="carousel-indicators">
				<li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
				<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
				<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
			</ol>
			<div class="carousel-inner">
				<div class="carousel-item active">
					<img class="d-block w-100" src="img/img01.jpg" alt="첫번째 슬라이드">
				</div>
				<div class="carousel-item">
					<img class="d-block w-100" src="img/img02.jpg" alt="두번째 슬라이드">
				</div>
				<div class="carousel-item">
					<img class="d-block w-100" src="img/img03.jpg" alt="세번째 슬라이드">
				</div>
			</div>
			<a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev"> <span class="carousel-control-prev-icon" aria-hidden="true"></span> <span class="sr-only">이전</span>
			</a> <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next"> <span class="carousel-control-next-icon" aria-hidden="true"></span> <span class="sr-only">다음</span>
			</a>
		</div>
	</div>
	<br>

	<div class="container container-fluid">
		<div class="row">
			<div class="col">
				<h3 class="text-center">여행 후기 게시판</h3>
				<table class="table table-hover table-hover table-striped table-responsive-sm">
					<thead>
						<tr class="text-center">
							<th scope="col">글 번호</th>
							<th scope="col">국가</th>
							<th scope="col">글 제목</th>
							<th scope="col">조회수</th>
						</tr>
					</thead>
					<tbody class="text-center">

						<tr class="table-primary">
							<th scope="row">1</th>
							<td>필리핀</td>
							<td>필리핀이 최고 !</td>
							<td>190</td>
						</tr>
						<tr class="table-primary">
							<th scope="row">2</th>
							<td>일본</td>
							<td>일본 가즈아ㅏㅏㅏㅏㅏ</td>
							<td>188</td>
						</tr>
						<tr class="table-primary">
							<th scope="row">3</th>
							<td>중국</td>
							<td>차이나 넘버완</td>
							<td>187</td>
						</tr>
						<tr class="table-primary">
							<th scope="row">4</th>
							<td>국내</td>
							<td>국내여행 후기입니다</td>
							<td>210</td>
						</tr>

					</tbody>
				</table>
			</div>
			<div class="col">
				<h3 class="text-center">동행 및 만남 게시판</h3>
				<table class="table table-hover table-hover table-striped table-responsive-sm">
					<thead>
						<tr class="text-center">
							<th scope="col">글 번호</th>
							<th scope="col">국가</th>
							<th scope="col">글 제목</th>
							<th scope="col">조회수</th>
						</tr>
					</thead>
					<tbody class="text-center">

						<tr class="table-primary text">
							<th scope="row">1</th>
							<td>필리핀</td>
							<td>필리핀 가실분~</td>
							<td>123</td>
						</tr>
						<tr class="table-primary">
							<th scope="row">2</th>
							<td>태국</td>
							<td>역시 방콕이 짱</td>
							<td>143</td>
						</tr>
						<tr class="table-primary">
							<th scope="row">3</th>
							<td>이탈리아</td>
							<td>피자 같이 드실분</td>
							<td>99</td>
						</tr>
						<tr class="table-primary">
							<th scope="row">4</th>
							<td>중국</td>
							<td>짜장면 같이 먹어요</td>
							<td>154</td>
						</tr>

					</tbody>
				</table>
			</div>
		</div>

		<!--<hr>-->
	</div>

	<!--Footer-->
	<footer class="page-footer font-small stylish-color-dark pt-4 mt-4">

		<div class="container text-center text-md-left">
			<hr>
			<div class="row text-center text-md-left mt-3 pb-3">

				<div class="col-md-3 col-lg-3 col-xl-3 mx-auto mt-3">
					<h6 class="text-uppercase mb-4 font-weight-bold">여행지 정보 공유 사이트</h6>
					<p>다녀온 여행지에 대한 정보를 공유하는 사이트 !</p>
				</div>

				<hr class="w-100 clearfix d-md-none">

				<div class="col-md-2 col-lg-2 col-xl-2 mx-auto mt-3">
					<h6 class="text-uppercase mb-4 font-weight-bold">여행사 홈페이지</h6>
					<p>
						<a href="#">여행사 1</a>
					</p>
					<p>
						<a href="#">여행사 2</a>
					</p>
					<p>
						<a href="#">여행사 3</a>
					</p>
					<p>
						<a href="#">여행사 4</a>
					</p>
				</div>

				<hr class="w-100 clearfix d-md-none">

				<div class="col-md-3 col-lg-2 col-xl-2 mx-auto mt-3">
					<h6 class="text-uppercase mb-4 font-weight-bold">기타 게시판</h6>
					<p>
						<a href="#!">후기 게시판</a>
					</p>
					<p>
						<a href="#!">동행 게시판</a>
					</p>
					<p>
						<a href="#!">여행 숙소 추천</a>
					</p>
					<p>
						<a href="#!">여행 맛집 게시판</a>
					</p>
				</div>
				<hr class="w-100 clearfix d-md-none">

				<div class="col-md-4 col-lg-3 col-xl-3 mx-auto mt-3">
					<h6 class="text-uppercase mb-4 font-weight-bold">Contact</h6>
					<p>
						<i class="fa fa-home mr-3"></i> 충북대학교 소프트웨어학과
					</p>
					<p>
						<i class="fa fa-envelope mr-3"></i>전문프로젝트 9조
					</p>
					<p>
						<i class="fa fa-envelope mr-3"></i>팀장 전희지 (2016039034)
					</p>
					<p>
						<i class="fa fa-phone mr-3"></i> 010-1234-5678
					</p>
				</div>

			</div>

			<hr>

			<div class="row py-3 d-flex align-items-center">

				<div class="col-md-8 col-lg-8">

					<p class="text-center text-md-left grey-text">
						© 2018 Copyright: <a href="#"><strong>전문프로젝트 9조 / 전희지 / 강경민 / 최동민 </strong></a>
					</p>

				</div>
				<div class="col-md-4 col-lg-4 ml-lg-0"></div>
			</div>
		</div>
	</footer>

	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>
	<script src="js/typed.js"></script>
	<script>
		$(document)
				.ready(
						function() {

							var typed2 = new Typed(
									'#typed2',
									{
										strings : [ '<h2 style="display: inline; ">여행지 정보 공유 사이트</h2>' ],
										typeSpeed : 50,
										fadeout : true,
										fadeOutClass : 'typed-fade-out',
										fadeOutDelay : 500,
										loop : true,
										showCursor : false
									});
						});
		$(document).ready(function() {

			$('#search').click(function() {
				// $('.alert').show();
				$('.alert').show();
			});

		});
	</script>
</body>
</html>
