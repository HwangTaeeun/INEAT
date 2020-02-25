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
    //네비바 로고 클릭 시 메인화면으로 이동
    $('.navbar-brand').click(function() {
       $(location).attr('href', '/oxo/main.eat');
    });
  	//스토리보드로 이동
   	$('#story').click(function(){
   		$(location).attr('href','/oxo/storyboard/storyBoard.eat');
   	});
    
 });

</script>
</head>
<body>

   <!--네비게이션바-->
   <nav class="navbar navbar-expand-lg navbar-light fixed-top bg">
      <a class="navbar-brand" href="#"><img src="img/logo.png"
         style="margin-left: 30px; width: 100px;"></a>
         
      <!--  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarColor03"
            aria-controls="navbarColor03" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>-->

      <div class="collapse navbar-collapse" id="navbar">
         <form class="form-inline col-10">
            <input class=" form-control col-11 mr-sm-2" type="text" placeholder="Search">
            <button class="btn btn-warning" type="submit">Search</button>
         </form>
         <ul class="navbar-nav float-left"
            style="width: 200px; margin-right: 20px;">
            <li class="nav-item" id="story"><a class="nav-link" href="#">Story</a></li>
            <li class="nav-item"><a class="nav-link" href="#">Matdcup</a></li>
            <li class="nav-item"><a class="nav-link" href="#">List</a></li>
            <li class="nav-item"><img src="img/member.png" width="30x"
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

</body>
</html>