<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link rel="stylesheet" href="/oxo/css/fullpage.min.css">
<link rel="stylesheet" href="/oxo/css/w3.css">
<link rel="stylesheet" href="/oxo/css/bootstrap.css">
<link rel="stylesheet" href="/oxo/css/nav.css">
<script type="text/javascript" src="/oxo/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="/oxo/js/popper.min.js"></script>
<script type="text/javascript" src="/oxo/js/fullpage.min.js"></script>
<script type="text/javascript" src="/oxo/js/pscript.js"></script>
<script type="text/javascript" src="/oxo/js/bootstrap.min.js"></script>
<style>
</style>
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
		});

		//추천페이지로 이동 ---태은추가
		$('.goRecommend').click(function() {
			$(location).attr('href', '/oxo/recommend/recommend.eat');
		});
		$('.cup').click(function() {
			$(location).attr('href', '/oxo/mat/matdcup.eat');
		});
		//2섹션 이미지
		$('.rvimg').each(function() {
			if ($('div', this).length > 3) {
				var gal = $(this).children().eq(2);
				var count = gal.nextAll().length;
				gal.nextAll().css("display", "none");
				gal.children('img').addClass('blurEffect');
				gal.append('<b></b>');
				gal.children('b').text("+" + count);
				gal.children('b').addClass('overindex');
			}
		});
		

		//3섹션 
		$('#hansik').click(
				function() {
					$(location).attr('href',
							'/oxo/ineatlist/list.eat?rno=1&ml_tag=한식');
				});
		$('#joongsik').click(
				function() {
					$(location).attr('href',
							'/oxo/ineatlist/list.eat?rno=1&ml_tag=중식');
				});
		$('#yangsik').click(
				function() {
					$(location).attr('href',
							'/oxo/ineatlist/list.eat?rno=1&ml_tag=양식');
				});
		$('#ilsik').click(
				function() {
					$(location).attr('href',
							'/oxo/ineatlist/list.eat?rno=1&ml_tag=일식');
				});
		$('#hsik').click(
				function() {
					$(location).attr('href',
							'/oxo/ineatlist/list.eat?rno=1&ml_tag=회식');
				});
		$('#cafe').click(
				function() {
					$(location).attr('href',
							'/oxo/ineatlist/list.eat?rno=1&ml_tag=카페');
				});

	});
</script>
<style>
.short_txt02 {
	overflow: hidden;
	display: -webkit-box;
	-webkit-line-clamp: 5;
	-webkit-box-orient: vertical;
}

.clearfix::before, .clearfix::after {
	display: block;
	content: '';
	clear: both;
}

#page1 {
	padding: 50px;
	background-color: rgba(255, 255, 255, 0.4);
	display: inline-block;
}

#mainimg {
	border: solid white 10px;
}
/*섹션2*/
.content2 {
	margin-top: 50px;
}

.reviewTitle {
	min-width: 930px;
	height: 40px;
	background-color: #ff7702;
	border-top-right-radius: 40px;
	margin: 20px auto;
}

.reviewBox {
	min-width: 930px;
	height: 10em;
	border: 2px solid #ff7702;
	background-color: white;
	margin: 15px auto;
	padding: 5px;
}

.rvtext {
	width: 244px;
	height: 115px;
	overflow: hidden;
}

.pic {
	border: solid white 1px;
	width: 100%;
	height: 100%;
	object-fit: cover;
}

.pic_1 {
	display: inline-block;
	position: relative;
	width: 108px;
	height: 108px;
	overflow: hidden;
	margin: 1px;
}
.img{
	cursor: pointer;
}
.overindex {
	margin: 0;
	text-align: center;
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	color: white;
	font-size: 24px;
}

.blurEffect {
	filter: brightness(70%);
}
/*3섹션*/
#page3 {
	align-content: center;
	padding: 20px 100px 20px 100px;
	width: 100%;
	background-color: rgba(255, 255, 255, 0.5);
	display: inline-block;
	border-top: 10px solid #ff7702;
	border-bottom: 10px solid #ff7702;
}

.img {
	margin: 10px;
}

.img:hover {
	border: solid white 10px;
	box-shadow: 0px 0px 20px rgba(255, 255, 255, 0.8);
}

<!--
로그인 모달창 css-->.form-control:focus {
	border: solid orange 2px;
	box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075), 0 0 8px
		rgba(255, 165, 0, 0.4)
}

.btn-w {
	width: 100%;
	margin-bottom: 0.5rem;
}

.size {
	font-size: 0.8rem;
	display: inline;
	text-align: center;
}

.w3-button:hover {
	color: #000 !important;
	background-color: rgba(253, 153, 0, 0.6) !important;
}
</style>
</head>
<body>
	<!-- 메인 -->
	<!--네비게이션바-->
	<nav class="navbar navbar-expand-lg navbar-light fixed-top bg">
		<a class="navbar-brand" href=""><img src="img/logo.png" style="margin-left: 30px; width: 100px;"></a>
		<script type="text/javascript">
			$(function() {
				//네비바 로고 클릭 시 메인화면으로 이동
				$('.navbar-brand').click(function() {
					$(location).attr('href', '/oxo/main.eat');
				});
			});
		</script>

		<div class="collapse navbar-collapse" id="navbar">
			<form class="form-inline col-10" action="/oxo/searchProc.eat" method="POST">
				<input class=" form-control col-11 mr-sm-2" type="text" placeholder="Search" name="contents">
				<button class="btn btn-warning" type="submit">Search</button>
			</form>
			<ul class="navbar-nav float-left"
				style="width: 200px; margin-right: 20px;">
				<li class="nav-item" id="story"><a class="nav-link" href="#">Story</a></li>
				<li class="nav-item" id="cup"><a class="nav-link" href="#">Matdcup</a></li>
				<li class="nav-item" id="list"><a class="nav-link" href="#">List</a></li>
				<script type="text/javascript">
					$(function() {
						//스토리 이동
						$('#story').click(function() {
							$(location).attr('href','/oxo/storyboard/storyBoard.eat');
							});
						//맛드컵 이동
						$('#cup').click(function() {
							$(location).attr('href', '/oxo/mat/matdcup.eat');
							});
						//리스트 이동
						$('#list').click(function() {
									$(location).attr('href','/oxo/ineatlist/list.eat');
							});
					});
				</script>
				<li class="nav-item"><img src="img/member.png" width="30x" style="margin-left: 15px;">
					<ul class="navbar-nav">
						<c:if test="${empty SID}">
							<li class="nav-item" id="loginbtn"><a class="nav-link" href="#">로그인</a></li>
							<li class="nav-item" id="joinbtn"><a class="nav-link" href="#">회원가입</a></li>
						</c:if>
						<c:if test="${not empty SID}">
							<li class="nav-item"><a class="nav-link" href="#" id="logout">로그아웃</a></li>
							<li class="nav-item"><a class="nav-link" id="memInfo">회원정보보기</a></li>
						</c:if>
					</ul></li>
			</ul>
		</div>
	</nav>
	<!--네비게이션바-->

	<!--메인-->
	<div id="fullpage" class="wrapper">
		<!-- 섹션1-->
		<div class="section"
			style="background: url('img/main.jpg') no-repeat; background-size: cover;">
			<div id="page1" style="margin-top: 5%;">
				<a href="#"><img src="img/click2.jpg" width="28%" id="mainimg" class="goRecommend" style="margin-left: 15px;"></a>
				<img src="img/ineat.png" width="30%" style="margin-right: 5%; margin-left: 5%;">
				<a href="#"> <img src="img/matdcup1.jpg" width="28%" id="mainimg" class="cup"></a>
			</div>
		</div>
		<!--임시섹션2-->
		<div class="section mt-n1" style="background: url('img/main2.jpg') no-repeat; background-size: cover;">
			<div class="content2">
				<div class="reviewTitle col-8">
					<h1 style="font-size: 38px; color: rgb(255, 255, 255);">
						<em>R e v i e w</em>
					</h1>
				</div>

				<c:forEach var="data" items="${REVIEW}" begin="0" end="3">
					<div class="reviewBox col-8">
						<div class="membInfo col-2 center-block mt-2" style="float: left; display: grid;">
							<c:if test="${data.p_savename != null}">
								<img src="/oxo/upload/${data.p_savename }" width="70px" height="70px" style="margin: 0 auto; border-radius: 50%;">
							</c:if>
							<c:if test="${data.p_savename == null}">
								<img src="/oxo/img/member.png" width="70px" height="70px" style="margin: 0 auto; border-radius: 50%;">
							</c:if>
							<h6></h6>
							<h4 class="badge badge-warning" style="font-size: 13px;">${data.m_id }</h4>
						</div>
						<div class="review col-10 clearfix d-flex" style="margin-top: 3px;">
							<div class="col-6 rvimg">
								<c:forEach var="data2" items="${data.rf_savename}">
									<div class="pic_1">
										<img src="upload/${data2}" class="pic">
									</div>
								</c:forEach>
							</div>
							<div class="col-4 rvtext">
								<p class="short_txt02">${data.rv_body }</p>
							</div>
							<div class="jumsu co-2" style="float: right;" width="50px" height="50px;">
								<h1 style="font-size: 80px; color: rgb(0, 148, 0);">
									<b><em>${data.rv_score }</em></b>
								</h1>
							</div>
						</div>
					</div>
				</c:forEach>


			</div>
		</div>

		<!--섹션3-->
		<div class="section" style="background: url('img/main.jpg') no-repeat; background-size: cover;" align="center">
			<div id="page3" style="margin-top: 5%;">
				<div align="left">
					<img src="img/한식1.jpg" onmouseover="this.src='img/한식2.jpg'" onmouseout="this.src='img/한식1.jpg'" width="250px" id="hansik" class="img">
					<img src="img/중식1.jpg" onmouseover="this.src='img/중식2.jpg'" onmouseout="this.src='img/중식1.jpg'" width="250px" id="joongsik" class="img">
					<img src="img/양식1.jpg" onmouseover="this.src='img/양식2.jpg'" onmouseout="this.src='img/양식1.jpg'" width="250px" id="yangsik" class="img">
				</div>
				<div style="margin-left: 30%;" align="right">
					<img src="img/일식1.jpg" onmouseover="this.src='img/일식2.jpg'" onmouseout="this.src='img/일식1.jpg'" width="250px" id="ilsik" class="img">
					<img src="img/회식1.jpg" onmouseover="this.src='img/회식2.jpg'" onmouseout="this.src='img/회식1.jpg'" width="250px" id="hsik" class="img">
					<img src="img/카페1.jpg" onmouseover="this.src='img/카페2.jpg'" onmouseout="this.src='img/카페1.jpg'" width="250px" id="cafe" class="img">
				</div>
			</div>
		</div>
	</div>

	<!-- 로그인 모달창 -->
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
			<!-- 로그인 모달 실제코드 여기까지 -->
		</div>
	</div>

</body>
</html>