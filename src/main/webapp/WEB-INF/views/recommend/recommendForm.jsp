<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<title>Bootstrap Example</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/oxo/css/fullpage.min.css">
<link rel="stylesheet" href="/oxo/css/w3.css">
<link rel="stylesheet" href="/oxo/css/bootstrap.css">
<link rel="stylesheet" href="/oxo/css/nav.css">
<style>
.bg {
	background-color: rgba(255, 255, 255, 1);
	border-color: rgba(214, 214, 214, 1);
}
.form-control:focus {
	border: solid orange 2px;
	box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075), 0 0 8px
		rgba(255, 165, 0, 0.4)
}
/* .content {
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
} */
body {
	background: url('/oxo/img/main.jpg') no-repeat;
	background-size: cover;
}
.card border-danger {
	width: 450px;
}
#thumNail {
	width: 430px;
	height: 330px;
	margin: 0px auto;
	margin-top: 10px;
	padding: 8px;
	border: 1px solid rgba(255, 119, 0, 0.5);
}
#recommendID {
	position: absolute;
	right: 10px;
}
.conImg img {
	height: 300px;
	opacity: 0.7;
}
.w3-content {
	background: white;
}
.white {
	background: rgba(255, 255, 255, 0.8);
	padding: 15px;
}
.imgClass {
	height: 350px;
}
.apiFont {
	font-size: 20px;
	color: #ff7702;
	font-weight: 600;
}
ul {
	cursor: pointer;
	
}
ul li:hover {
	color: #ff7702;
}
h2 {
	color: #ff7702;
}
#more {
	margin-left:5px;
}
</style>
<script type="text/javascript" src="/oxo/js/jquery-3.4.1.min.js"></script>
	<script type="text/javascript" src="/oxo/js/popper.min.js"></script>
	<script type="text/javascript" src="/oxo/js/fullpage.min.js"></script>
	<script type="text/javascript" src="/oxo/js/pscript.js"></script>
	<script type="text/javascript" src="/oxo/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="/oxo/js/nav.js"></script>
	<script type="text/javascript" src="/oxo/js/recommend.js"></script>
	<script type="text/javascript">
	$(function() {
		//로그인처리
		$('#login').css('display', 'none');
		$('#loginbtn').click(function() {
			$('#login').css('display', 'block');
		});
		$('#x').click(function() {
			$('#login').css('display', 'none');
		});

		$('#loginsub').click(function() {
			$.ajax({
				url : "/oxo/member/loginProc.eat",
				type : "post",
				dataType : "json",
				data : {
					"id" : $('#id').val(),
					"pw" : $('#password').val()
				},
				success : function(cnt) {
					if (cnt == 1) {
						location.reload();
					} else {
						alert('로그인에 실패하였습니다.');
					}
				},
				error : function() {
					alert('###에러');
				}
			});
		});

		//로그아웃
		$('#logout').click(function() {
			$(location).attr('href', '/oxo/member/logout.eat');
		});

		//회원가입처리
		$('#joinbtn').click(function() {
			$(location).attr('href', '/oxo/member/join.eat');
		});
		//회원정보보기로 이동
		$('#memInfo').click(function() {
			 $(location).attr('href', '/oxo/member/memInfo.eat?id=' + '${SID}');
			/* $('#id').val('${SID}');
			$('#membFrm').submit(); */
		});
		//맛드컵 이동
		$('#cup').click(function() {
			$(location).attr('href', '/oxo/mat/matdcup.eat');
		});
	});	
	</script>
</head>

<body>
<!-- <form id="membFrm" method="post" action="memInfo.eat">
	<input type="hidden" id="id" name="id"> 
</form> -->
	<!--네비게이션바-->
	<nav class="navbar navbar-expand-lg navbar-light bg">
		<a class="navbar-brand" href="#"><img src="/oxo/img/logo.png"
			style="margin-left: 30px; width: 100px;"></a>

		<!--  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarColor03"
            aria-controls="navbarColor03" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>-->

		<div class="collapse navbar-collapse" id="navbar">
			<form class="form-inline col-10" action="/oxo/searchProc.eat"
				method="POST">
				<input class=" form-control col-11 mr-sm-2" type="text"
					placeholder="Search" name="contents">
				<button class="btn btn-warning" type="submit">Search</button>
			</form>
			<ul class="navbar-nav float-left"
				style="width: 200px; margin-right: 20px;">
				<li class="nav-item" id="story"><a class="nav-link" href="#">Story</a></li>
				<li class="nav-item" id="cup"><a class="nav-link" href="#">Matdcup</a></li>
				<li class="nav-item" id="list"><a class="nav-link" href="#">List</a></li>
				<li class="nav-item"><img src="/oxo/img/member.png" width="30x"
					style="margin-left: 15px;">
					<ul class="navbar-nav">
						<c:if test="${empty SID}">
							<li class="nav-item" id="loginbtn"><a class="nav-link"
								href="#">로그인</a></li>
							<li class="nav-item" id="joinbtn"><a class="nav-link"
								href="#">회원가입</a></li>
						</c:if>
						<c:if test="${not empty SID}">
							<li class="nav-item"><a class="nav-link" href="#"
								id="logout">로그아웃</a></li>
							<li class="nav-item"><a class="nav-link" href="#"
								id="memInfo">회원정보보기</a></li>
						</c:if>
					</ul></li>
			</ul>
		</div>
	</nav>
	<!--네비게이션바-->
	<div class="container-fhd">
		<div class="row" style="padding: 50px;">
			<div class="col-sm-4 white">
				<h2>
					<em>inEAT Recommend</em>
				</h2>
				<div class="card " id="box1" style="height: 505px;">
					<img id="thumNail"
						class="imgClass img-thumbnail card-img-top img-responsive">
					<div class="card-body">
						<p class="card-text">
							현재 기온은 <span class="apiFont" id="ctemp"></span>℃로 <span
								class="apiFont" id="dayCondition"></span> 입니다.<br> <span
								class="recommendTitle apiFont"></span>의 <span
								class="recommendMenu apiFont"></span>, 추천드립니다!
						</p>
						<div class="">
							<button type="button" class="btn btn-warning " id="recommendID"
								style="bottom: 10px;">
								<span class="recommendTitle"></span>&nbsp검색
							</button>
						</div>
					</div>

				</div>
			</div>
			<div class="col-sm-4 white">

				<!-- 검색으로 보내기 -->
				<form class="form-inline col-9" action="/oxo/searchProc.eat"
					method="POST" id="frm">
					<input type="hidden" id="contents" name="contents">
				</form>

				<h2>
					<em>MENU LIST</em>
					<button type="button" class="btn btn-warning" data-toggle="modal"
						data-target="#exampleModalScrollable" id="more">more</button>
				</h2>
				<ul class="list-group">
					<c:forEach begin="0" end="9" var="listMenu" items="${LISTMENU}">
						<li class="list-group-item listMenu" id="list_ml_menu"><h5>${listMenu.ml_menu}</h5></li>
					</c:forEach>
				</ul>
			</div>

			<!-- 스토리로 보내기 -->
			<div class="col-sm-4 white">
				<h2>
					<em>LAST WEEKLY TOP 10</em>
				</h2>
				<ul class="list-group">
					<c:forEach var="list" items="${LIST}">
						<li class="list-group-item listTitle" id="${list.ml_no}"><h5>${list.ml_title}
								<span class="badge badge-success badge-pill">★
									${list.avg}</span>
							</h5></li>
					</c:forEach>
				</ul>
			</div>
		</div>
	</div>



	<!-- Modal -->
	<div class="modal fade" id="exampleModalScrollable" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalScrollableTitle"
		aria-hidden="true">
		<div class="modal-dialog modal-dialog-scrollable" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h2 class="modal-title" id="exampleModalScrollableTitle">
						<em>MENU LIST</em></h2>
				</div>
				<div class="modal-body">
					<ul class="list-group">
					<c:forEach var="listMenu" items="${LISTMENU}">
						<li class="list-group-item listMenu" id="list_ml_menu"><h5>${listMenu.ml_menu}</h5></li>
					</c:forEach>
					</ul>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
	
	
	<div id="login" class="w3-modal">
		<div class="w3-modal-content" style="width: 35%">
			<div class="w3-container w3-padding">
				<span id="x" style="margin: 10px 18px 0px 0px;" class="w3-button w3-display-topright">&times;</span>
				<!-- 로그인 모달 실제코드 -->

				<div style="border: solid orange 2px;">
					<div>
						<div style="text-align: center;">
							<img src="/oxo/img/logo.png" width="50%" style="align-content: center; padding-top: 20px;">
						</div>
						<div style="padding: 20px 20px 0px 20px; margin: 20px 20px 20px 20px;">
							<div>
								<input type="text" class="form-control inputheight " id="id" name="id" placeholder="I D"">
							</div>
							<div>
								<input type="password" class="form-control inputheight" style="margin-top: 10px;" id="password" name="pw" placeholder="Password">
							</div>
							<div>
								<br>
								<button type="button" class="btn btn-warning btn-w" id="loginsub">Login</button>
							</div>
							<div style="display: inline-block; margin: 0px;" class="row col-md-12">
								<div class="size col-md-6" style="float: left;">
									<p class="text-warning size idFind">
										<b>아이디찾기</b>
									</p>
								</div>
								<script type="text/javascript">
									$(function() {
										$('.idFind') .click( function() {
											 $(location) .attr('href','/oxo/member/idFind.eat');
										});
									});
								</script>
								<div class="size col-md-6" style="float: right;">
									<p class="text-warning size passFind">
										<b>비밀번호찾기</b>
									</p>
								</div>
								<script>
									$(function() {
										//비밀번호 찾기 버튼 클릭시 비밀번호 찾는 창으로 이동
										$('.passFind').click(function() {
											 $(location).attr('href','/oxo/member/passFind.eat');
										});
									});
								</script>
							</div>
							<p></p>
							<p class="text-muted text-center pt-1">Copyright © INEAT Corp. All Rights Reserved.</p>
						</div>
					</div>
				</div>
			</div>
		</div>	
	</div>
	${SID}
</body>

</html>