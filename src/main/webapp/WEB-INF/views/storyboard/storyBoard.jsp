<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>story board</title>
<script type="text/javascript" src="/oxo/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="/oxo/js/bootstrap.min.js"></script>

<link rel="stylesheet" href="/oxo/css/w3.css">
<link rel="stylesheet" href="/oxo/css/bootstrap.min.css">
<link rel="stylesheet" href="/oxo/css/nav.css">
<style>
<!--
로그인 모달창 css-->
.form-control:focus {
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

.title{
	color:white;
	font-size:14px;
	font-weight: 900;
	height: 50px;
	line-height :30px;
}

#toWrite{
	width:100px;
	right:-25px;
}

</style>

<script type="text/javascript">
$(function(){
	// 작성페이지로
	$('#toWrite').click(function(){
		if('${SID}' == ""){
			alert("로그인 후 이용해 주세요.");
		}else{
			location.href = "/oxo/storyboard/storyBoardWrite.eat";
		};
	});
	// 홈페이지로
	$('#toHome').click(function(){
		location.href = "/oxo/main.eat";
	});
	// 상세보기
	$('.toInfo').click(function(){
		
		var listbno = $(this).attr('id');
		
		$('#bno').val(listbno);
		
		/* $('#bno').val(textbno);
		$('#mid').val(textmid); */
		
		$('#form1').submit();
	});
	
	// 페이지 버튼 처리
	if('${PAGE.startPage}' == 1){
		$('#preBtn').toggleClass('pBtn');	
	}
	if('${PAGE.endPage}' == '${PAGE.totalPage}'){
		$('#nextBtn').toggleClass('pBtn');
	}
	
	$('.pBtn').click(function(){
		var sPage = $(this).html();
		var ptxt = $('#preBtn').html();
		var ntxt = $('#nextBtn').html();
		if(sPage == '${PAGE.nowPage}') return;
		
		if(sPage == ptxt){
			sPage = '${PAGE.startPage - 1}';
			$('#nowPage').val(sPage);
		} else if(sPage == ntxt){
			sPage = '${PAGE.endPage + 1}';
			$('#nowPage').val(sPage);
		} else {
			$('#nowPage').val(sPage);
		}
		$('#form2').submit();
	});
	
	// 메인 네비
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
	});
	
});



</script>
</head>
<body>
	<div>
	<!--네비게이션바-->
	<script type="text/javascript">
		$(function() {
			//네비바 로고 클릭 시 메인화면으로 이동
			$('.navbar-brand').click(function() {
				$(location).attr('href', '/oxo/main.eat');
			});
			
			//스토리 이동
			$('#story').click(function(){
				$(location).attr('href','/oxo/storyboard/storyBoard.eat');
			});
			
			//맛드컵 이동
			$('#cup').click(function(){
		           $(location).attr('href','/oxo/mat/matdcup.eat');
		    });
			//리스트 이동
			$('#list').click(function(){
				$(location).attr('href','/oxo/ineatlist/list.eat');
			});
		});
	</script>
	
	<nav class="navbar navbar-expand-lg navbar-light fixed-top bg">
		<a class="navbar-brand" href="#"><img src="/oxo/img/logo.png" style="margin-left: 30px; width: 100px;"></a>
		<div class="collapse navbar-collapse" id="navbar">
	    	<form class="form-inline col-10" action="/oxo/searchProc.eat" method="POST">
	        	<input class=" form-control col-11 mr-sm-2" type="text" placeholder="Search" name="contents" />
	            <button class="btn btn-warning" type="submit">Search</button>
	        </form>
	        <ul class="navbar-nav float-left" style="width: 200px; margin-right: 20px;">
	        	<li class="nav-item" id="story"><a class="nav-link" href="#">Story</a></li>
	            <li class="nav-item" id="cup"><a class="nav-link" href="#">Matdcup</a></li>
	            <li class="nav-item" id="list"><a class="nav-link" href="#">List</a></li>
	            <li class="nav-item"><img src="/oxo/img/member.png" width="30x" style="margin-left: 15px;">
	            	<ul class="navbar-nav">
	                	<c:if test="${empty SID}">
	                  		<li class="nav-item" id="loginbtn"><a class="nav-link" href="#">로그인</a></li>
	                  		<li class="nav-item" id="joinbtn"><a class="nav-link" href="#">회원가입</a></li>
	                  	</c:if>
	                  	<c:if test="${not empty SID}">
	                    	<li class="nav-item"><a class="nav-link" href="#" id="logout">로그아웃</a></li>
	                    	<li class="nav-item"><a class="nav-link" href="#" id="memInfo">회원정보보기</a></li>
	                  	</c:if>
	               	</ul>
				</li>
			</ul>
		</div>
	</nav>
	<!--네비게이션바-->
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

	<div style="margin-top:80px; display:none;">
		<form method="post" action="/oxo/storyboard/storyBoardInfo.eat" id="form1">
			bno:<input type="text" name="bno" id="bno">
			sid:<input type="text" name="mid" value="${SID }">
		</form>
		
	sid:<input type="text" value="${SID }">
	
		<form method="post" action="/oxo/storyboard/storyBoard.eat" id="form2">
			nowpage:<input type="text" name="nowPage" id="nowPage">
		</form>
	</div>

	<div class="container-fluid" style="margin-top:110px">

	    </div>
<!-- 		<div class="row text-center">
			<div class="col-md-2"></div>
	        <div class="col-md-8 text-warning font-italic"><h1>inEat Story</h1></div>  -->
	    </div>

	
	    <div class="row mt-3 text-center kor title row align-items-center" style="height:20px;">
	        <div class="col-md-1"></div>
	        <div class="col-md-1 border-bottom" style="background-color:orange; margin-top:-20px;">　</div>
	        <div class="col-md-4 border-bottom " style="background-color:orange;  margin-top:-20px;">제목</div>
	        <div class="col-md-2 border-bottom" style="background-color:orange; margin-top:-20px;">작성자</div>
	        <div class="col-md-1 border-bottom" style="background-color:orange; margin-top:-20px;">작성일</div>
	        <div class="col-md-1 border-bottom" style="background-color:orange; margin-top:-20px;">L&H</div>
	        <div class="col-md-1 border-bottom" style="background-color:orange; margin-top:-20px;">조회수</div>
	    </div>
	    <c:forEach var="data" items="${LIST }">
		    <div class="row mt-1 text-center kor2">
		        <div class="col-md-1"></div>
		        <div class="col-md-1 border-bottom" style="height:105px;">
			        <c:if test="${data.saveName == null }">
		    			<img src="/oxo/img/ineat_noimage.jpg" style="position:absolute; top:0; left:0; width:100%; height:98%; object-fit:cover;" class="border"  >
		    		</c:if>
		    		<c:if test="${data.saveName != null}">
		    			<img src="/oxo/upload/${data.saveName }" style="position:absolute; top:0; left:0; width:100%; height:98%; object-fit:cover;" class="border">
		    		</c:if>
		        </div>
		        <div class="col-md-4 border-bottom toInfo" id="${data.bno}" style="padding-top:35px; cursor:pointer;">
		        	<c:if test="${data.title.length() ge 25 }">
	        			${data.title.substring(0, 25) }...
	        		</c:if>
	        		<c:if test="${data.title.length() lt 25 }">
	        			${data.title}
	        		</c:if>
	        		<c:if test="${data.cmtCnt > 0 }">
		        		[${data.cmtCnt }]
	        		</c:if>
	        	</div>
		        <div class="col-md-2 border-bottom" style="padding-top:35px">${data.mid}</div>
		        <div class="col-md-1 border-bottom" style="padding-top:35px">${data.sbDate }</div>
		        <div class="col-md-1 border-bottom" style="padding-top:23px"><img src="/oxo/img/like_16px.jpg">${data.llike }<p><img src="/oxo/img/hate_16px.jpg">${data.hhate }</div>
		        <div class="col-md-1 border-bottom" style="padding-top:35px">${data.views }</div>
		        <div class="col-md-1"></div>
		    </div>
	    </c:forEach>
		  <ul class="pagination justify-content-center mt-3 " style="margin-bottom:-20px;">
		    <li class="page-item">
		      <a class="page-link pBtn" href="#" tabindex="-1" aria-disabled="true" id="preBtn">Prev</a>
		    </li>
		    <c:forEach var="page" begin="${PAGE.startPage }" end="${PAGE.endPage }">
		    <li class="page-item"><a class="page-link pBtn" href="#">${page }</a></li>
		    </c:forEach>
		    <li class="page-item">
		      <a class="page-link pBtn" href="#" id="nextBtn">Next</a>
		    </li>
		  </ul>
		  
		  <div class="row kor2">
	        <div class="col-md-10"></div>
	        	<div class="btn-group" role="group">
	        		<button type="button" id="toWrite" style="bottom:15px;" class="btn btn-warning">글 쓰 기</button>
	        	</div>
	        </div>
		

	    
	    
	</div>
</body>
</html>