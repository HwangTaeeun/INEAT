<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>맛집 리스트</title>

<link rel="stylesheet" href="/oxo/css/w3.css">
<link rel="stylesheet" href="/oxo/css/bootstrap.css">
<link rel="stylesheet" href="/oxo/css/nav.css">
<link rel="stylesheet" href="/oxo/fonts/Jua-Regular.ttf">
<link href="https://fonts.googleapis.com/css?family=Jua&display=swap" rel="stylesheet">
<script type="text/javascript" src="/oxo/js/jquery.min.js"></script>
<script type="text/javascript" src="/oxo/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/oxo/js/popper.min.js"></script>

<style>
.rv-text-box{
	font-size: 1.000rem;
}
.btn-group-toggle{
	font-family: "Jua", sans-serif;
}
ul {
	list-style: none;
	width: auto;
	padding-left: 15px;
}

.bg {
	background-color: rgba(255, 255, 255, 1);
	border-color: rgba(214, 214, 214, 1);
	;
}

.imgbox {
	min-width: 238px;
	height: 238px;
	overflow: hidden;
	position: relative;
}
.pic{
	width: 100%;
	height: 100%;
	object-fit: cover;
}
.pimgbox {
    width: 40px;
    height: 40px;
    border-radius: 50%;
    overflow: hidden;
}


.imgbox img {
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	object-fit: cover;
}

.text_box {
	width: 100%;
	height: 100%;
}

.text_box ul li {
	margin: 5px 0;
}

.text_box div {
	right: 0;
}

.mainlist {
	padding-top: 40px;
	padding-bottom: 40px;
	width: 900px;
	margin: 0 auto;
	border-bottom: 1px solid #dbdbdb;
	position: relative;
}
.mainlist:hover {
	background:#8080801a;
}


.listtop {
	padding-top: 30px;
	padding-bottom: 5px;
	width: 900px;
	margin: 0 auto;
	border-bottom: 1px solid #dbdbdb;
	position: relative;
}

.list_row {
	position: absolute;
	right: 0;
	bottom: 0;
	padding-bottom: 5px;
}

.list_row div {
	margin: auto 5px;
}

.page_box {
	margin-top: 20px;
}
.detail {
	cursor:pointer;
}
.favorite{
	width:35px;
	cursor:pointer;
	height:35px;
}
.loginpls{
	width:35px;
	cursor:pointer;
	height:35px;
}
.lr{
	cursor: pointer;
	padding: 5px 8px 6px 8px;
}
.type{
	font-size: 14px;
}
b{
 margin-right: 5px;
}

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
	      
	      $('#loginsub').click(function(){
	         $.ajax({
	            url : "/oxo/member/loginProc.eat",
	            type : "post",
	            dataType : "json",
	            data : {"id" : $('#id').val(),
	               "pw" : $('#password').val()},
	            success : function(cnt){
	               if(cnt==1){
	                  location.reload();
	               }else{
	                  alert('로그인에 실패하였습니다.');
	               }
	            },
	            error : function(){
	               alert('###에러');
	            }
	         });
	      });
	      
	      
	      //로그아웃
	      $('#logout').click(function(){
	         $(location).attr('href', '/oxo/member/logout.eat');
	      });
	      
	      //회원가입처리
	      $('#joinbtn').click(function() {
	         $(location).attr('href', '/oxo/member/join.eat');
	      });
	   	//회원정보보기로 이동
	   		var id = '${SID}'
	   		$('#memInfo').click(function(){
	   			$(location).attr('href','/oxo/member/memInfo.eat?id='+id);
	   		});

		var isEnd = false;
		var rno = 1;
		
		var type = 'cnt';
		$('.type').click(function(){
			type = $(this).attr('id');
			
		});
		$('.badge').click(function(){
			$(this).removeClass('badge-light');
			$(this).removeClass('badge-success');
			$(this).addClass('badge-success');
			$(this).siblings().removeClass('badge-success');
			$(this).siblings().removeClass('badge-light');
			$(this).siblings().addClass('badge-light');
		});
		var tag = '';
		var total = 5;
		
		$(document).on('click', '.detail', function(e) {
			e.stopImmediatePropagation();
			var no = $(this).attr('data-id')
			$(location).attr('href','/oxo/ineatlist/info.eat?ml_no='+no);
		});
		
		$(document).on('click', '.loginpls', function(e) {
			e.stopImmediatePropagation();
			alert('로그인 후 처리하세요');
		});
		
		
		
		$(document).on('click', '.favorite', function(e) {
			e.stopImmediatePropagation();
			var fav = $(this);
			
			var ml_no = fav.attr('data-id');
			 $.ajax({
	            url : "/oxo/ineatlist/favoriteup.eat",
	            type : "post",
	            dataType : "json",
	            data : {
					ml_no : ml_no
	            },
	            success : function(data){
	            	console.log(data);
	            	if(fav.find('img').attr('src').includes("favorite2")) {
	    				fav.find('img').attr('src','/oxo/img/favorite.png');
	    				fav.removeClass('f_in');
	    				fav.addClass('f_out');
	    				console.log('성공');
	    			}else {
	    				fav.find('img').attr('src','/oxo/img/favorite2.png');
	    				fav.removeClass('f_out');
	    				fav.addClass('f_in');
	    				console.log('실패');
	    			}
	            },
	            error : function(){
	               alert('###에러');
	            }
			});
		});
		$(".list_ajax").click(function(e) {
			e.preventDefault();
			var tid = $(this).attr('id');
			var tclass = $(this).attr('class');
			if (tclass.match('tag')) {
				$('#listbox').children('div').remove();
				tag = tid;
				rno = 1;
			} else if (tclass.match('type')) {
				$('#listbox').children('div').remove();
				type = tid;
				rno = 1;
			} else if (tclass.match('more')) {
				rno += 5;
			}
			
			
			/* 더보기 ajax */
			$.ajax({
				url : "/oxo/ineatlist/morelist.eat",
				type : "post",
				dataType : "json",
				data : {
					rno : rno,
					ml_type : type,
					ml_tag : tag
				},
				success : function(data) {
					
					var length = data.length;
					$('.more').css('display', 'block');
					if (length < 5) {
						$('.more').css('display', 'none');
					}
					for (var i = 0; i < length; i++) {
						var resultlist = '';
						resultlist += '<div class="d-flex mainlist pr-4">';
						resultlist += '<h1 style="display: inline-block; margin-right: 10px;">'+data[i].rno+'.</h1>';
						resultlist += '<div class="imgbox detail" data-id="'+data[i].ml_no +'">';
						resultlist += '<img src="/oxo/mainlist/'+data[i].ml_title +'1.jpg">';
						resultlist += '</div>';
						resultlist += '<div class="text_box position-relative">';
						
						if(data[i].favorite == '0'){
							resultlist += '<div class="favorite f_in position-absolute" data-id="'+data[i].ml_no +'">';
							resultlist += '<img src="/oxo/img/favorite2.png" style="width: 100%;">';
							resultlist += '</div>';
						}else if(data[i].favorite == '1'){
							resultlist += '<div class="favorite f_out position-absolute" data-id="'+data[i].ml_no +'">';
							resultlist += '<img src="/oxo/img/favorite.png" style="width: 100%;">';
							resultlist += '</div>';
						}else if(data[i].favorite == null){
							resultlist += '<div class="loginpls position-absolute">';
							resultlist += '<img src="/oxo/img/favorite2.png" style="width: 100%;">';
							resultlist += '</div>';
						}
						
						resultlist += '<ul>';
						resultlist += '<li>';
						resultlist += '<h1 class="d-inline-block m-0 detail" data-id="'+data[i].ml_no +'">'+data[i].ml_title +'</h1>';
						resultlist += '<h1 class="d-inline-block m-0 ml-2 text-success">'+data[i].avg+'</h1>';
						resultlist += '</li>';
						resultlist += '<li>';
						resultlist += '<h4>';
						resultlist += '<small class="text-muted">'+data[i].ml_newaddr+'</small>';
						resultlist += '</h4>';
						resultlist += '</li>';
						var idx = 1;
						if(data[i].rvList.length >= 2){
							idx = 2;
						}
						for (var j = 0; j < idx; j++) {
							var t1 = data[i].rvList;
							if(t1.length > 0){
							resultlist += '<li class="d-flex mb-2">';
							resultlist += '<div>';
							resultlist += '<div class="pimgbox mr-2">';
							resultlist += '<img src="/oxo/upload/'+t1[j].profile+'" alt="avt" class="pic">';
							resultlist += '</div>';
							resultlist += '</div>';
							resultlist += '<div>';
							resultlist += ' <b>'+ t1[j].m_id+'</b>'+ t1[j].rv_body+'';
							resultlist += '</div>';
							resultlist += '</li>';
							}
						}
						resultlist += '</ul>';
						resultlist += '</div>';
						resultlist += '<div style="position:absolute; bottom: 10px; right: 5px;" class="detail" data-id="'+data[i].ml_no +'">';
						resultlist += '<h4>';
						resultlist += '<small class="text-muted"> 자세히 보기 > </small>';
						resultlist += '</h4>';
						resultlist += '</div>';
						resultlist += '</div>';
						$('#listbox').append(resultlist);
					}
					total = $("#listbox").children('div').length;
					$('#total').html(total);
				}
			});
		});
	});
</script>
</head>

<body>
	<!--네비게이션바-->
   <nav class="navbar navbar-expand-lg navbar-light fixed-top bg">
      <a class="navbar-brand" href="#"><img src="/oxo/img/logo.png"
         style="margin-left: 30px; width: 100px;"></a>
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
			  $(function(){
			  	//스토리 이동
			  	$('#story').click(function(){
			  		$(location).attr('href','/oxo/storyboard/storyBoard.eat');
			  	});
			  	//맛드컵 이동
			  	//리스트 이동
			  	$('#list').click(function(){
			  		$(location).attr('href','/oxo/ineatlist/list.eat');
			  	});
			   });
			</script>
              <li class="nav-item"><img src="/oxo/img/member.png" width="30x"
               style="margin-left: 15px;">
               <ul class="navbar-nav">
                  <c:if test="${empty SID}">
                  <li class="nav-item" id="loginbtn"><a class="nav-link" href="#">로그인</a></li>
                  <li class="nav-item" id="joinbtn"><a class="nav-link" href="#">회원가입</a></li>
                  </c:if>
                  <c:if test="${not empty SID}">
                     <li class="nav-item"><a class="nav-link" href="#" id="logout">로그아웃</a></li>
                     <li class="nav-item"><a class="nav-link" href="#" id="memInfo">회원정보보기</a></li>
                  </c:if>
               </ul></li>
         </ul>
      </div>
   </nav>
   <!--네비게이션바-->
   
   

	<div class="container" style="margin-top: 100px;">
		<div class="row">
			<div style="width: 900px; margin: 0 auto;" class="pb-5">
				<!-- 태그 버튼들 정렬내용. -->
				<div class="btn-group-toggle d-flex justify-content-between col-12"
					data-toggle="buttons">
					<label class="btn btn-warning btn-lg list_ajax tag" id="한식">
						<input type="radio" name="options" id="option1" autocomplete="off">
						#한식
					</label> <label class="btn btn-warning btn-lg list_ajax tag" id="중식">
						<input type="radio" name="options" id="option2" autocomplete="off">
						#중식
					</label> <label class="btn btn-warning btn-lg list_ajax tag" id="양식">
						<input type="radio" name="options" id="option3" autocomplete="off">
						#양식
					</label> <label class="btn btn-warning btn-lg list_ajax tag" id="일식">
						<input type="radio" name="options" id="option4" autocomplete="off">
						#일식
					</label> <label class="btn btn-warning btn-lg list_ajax tag" id="회식">
						<input type="radio" name="options" id="option5" autocomplete="off">
						#회식
					</label> <label class="btn btn-warning btn-lg list_ajax tag" id="카페">
						<input type="radio" name="options" id="option6" autocomplete="off">
						#카페
					</label>
				</div>

				<div class="listtop">
					<div>
						<em id="total">${TOTAL }</em>개<span id="common">(${type }순)</span>
					</div>
					
					
					<div class="list_row d-flex">
						<div class="lr badge badge-pill badge-success">
							<span class="list_ajax type" id="cnt">조회순</span>
						</div>
						<div class="lr badge badge-pill badge-light">
							<span class="list_ajax type " id="rv_cnt">리뷰순</span>
						</div>
						<div class="lr badge badge-pill badge-light">
							<span class="list_ajax type " id="fvr">좋아요순</span>
						</div>
					</div>
				</div>

				<!-- 리스트 컬럼 -->
				<div id="listbox">
				
					<c:forEach var="data" items="${LIST }" varStatus="sts">
						<div class="d-flex mainlist pr-4">
						
							<!-- 넘버 -->
							<h1 style="display: inline-block; margin-right: 10px;">${sts.count}.</h1>
							<!-- 이미지박스 -->
							<div class="imgbox detail" data-id="${data.ml_no }">
								<img src="/oxo/mainlist/${data.ml_title}1.jpg">
							</div>
							<!-- 텍스트박스 -->
							<div class="text_box position-relative">
							
								<c:choose>
									<c:when test="${data.favorite eq '0'}">
										<div class="favorite f_in position-absolute" data-id="${data.ml_no }">
											<img src="/oxo/img/favorite2.png" style="width: 100%;">
										</div>
									</c:when>
									<c:when test="${data.favorite eq '1'}">
										<div class="favorite f_out position-absolute" data-id="${data.ml_no }">
											<img src="/oxo/img/favorite.png" style="width: 100%;">
										</div>
									</c:when>
									<c:otherwise>
										<div class="loginpls position-absolute">
											<img src="/oxo/img/favorite2.png" style="width: 100%;">
										</div>
									</c:otherwise>
								</c:choose>
								
								<ul style="margin-top: -11px;">
									<li>
										<h1 class="d-inline-block m-0 detail" data-id="${data.ml_no }"> ${data.ml_title }</h1>
										<h1 class="d-inline-block m-0 ml-2 text-success">${data.avg }</h1>
									</li>
									<li style="margin-bottom: 15px;">
										<h4>
											<small class="text-muted ">${data.ml_newaddr }</small>
										</h4>
									</li>
									<c:forEach var="data2" items="${data.rvList}" varStatus="sts" begin="0" end="1">
									<li class="d-flex mb-2 rv-text-box">
										<div>
											<div class="pimgbox mr-2">
												<img src="/oxo/upload/${data2.profile}" alt="avt" class="pic">
											</div>
										</div>
										<div>
											<b>${data2.m_id }</b>${data2.rv_body}
										</div>
									</li>
									</c:forEach>
								</ul>
							</div>
							<div style="position:absolute; bottom: 10px; right: 5px;" class="detail" data-id="${data.ml_no }">
								<h4>
									<small class="text-muted">자세히 보기 > </small>
								</h4>
							</div>
						</div>
					</c:forEach>
					
				</div>


				<!-- 페이징처리  -->
				<div class="text-center page_box more list_ajax" id="more">
					<button class="btn btn-warning">더보기</button>
				</div>

			</div>
		</div>
	</div>
	
	<!-- 로그인 모달창 -->
   <div id="login" class="w3-modal">
      <div class="w3-modal-content" style="width: 35%">
         <div class="w3-container w3-padding">
            <span id="x" style="margin: 10px 18px 0px 0px;"
               class="w3-button w3-display-topright">&times;</span>
            <!-- 로그인 모달 실제코드 -->

            <div style="border: solid orange 2px;">
               <div>
                  <div style="text-align: center;">
                     <img src="/oxo/img/logo.png" width="50%"
                        style="align-content: center; padding-top: 20px;">
                  </div>
                  <div
                     style="padding: 20px 20px 0px 20px; margin: 20px 20px 20px 20px;">
                     <div>
                        <input type="text" class="form-control inputheight " id="id" name="id"
                           placeholder="I D"">
                     </div>
                     <div>
                        <input type="password" class="form-control inputheight "
                           style="margin-top: 10px;" id="password" name="pw" placeholder="Password">
                     </div>
                     <div>
                        <br>
                        <button type="button" class="btn btn-warning btn-w" id="loginsub">Login</button>
                     </div>
                     <div style="display: inline-block; margin: 0px;"  class="row col-md-12">
                        <div class="size col-md-6" style="float: left;">
                           <p class="text-warning size idFind">
                           <b>아이디찾기</b>
                           </p>
                        </div>
                        
                        <script type="text/javascript">
                        $(function(){
                        	$('.idFind').click(function(){
                        		$(location).attr('href','/oxo/member/idFind.eat');
                        	});
                        });
                        </script>
                        <div class="size col-md-6" style="float: right;">
                           <p class="text-warning size passFind">
                              <b>비밀번호찾기</b>
                           </p>
                        </div>
                        <script>
                        $(function(){
                		//비밀번호 찾기 버튼 클릭시 비밀번호 찾는 창으로 이동
                		$('.passFind').click(function(){
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
   <!-- 모달 ㅂㅂ  -->
</body>

</html>