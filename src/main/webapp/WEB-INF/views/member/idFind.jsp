<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link rel="stylesheet" href="/oxo/css/w3.css" >
<link rel="stylesheet" href="/oxo/css/bootstrap.css" >
<script type="text/javascript" src="/oxo/js/jquery-3.4.1.min.js" ></script>
<script type="text/javascript" src="/oxo/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/oxo/js/popper.min.js"></script>
<style>
.form-control:focus {
  border:solid orange 2px;
  box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075), 0 0 8px rgba(255, 165, 0, 0.4)
}

.btn-w{
    width: 49.5%;
    margin-bottom: 0.5rem;
}
.btn-pass{
    width: 100%;
    margin-bottom: 0.5rem;
}

.size{
    font-size: 0.8rem;
    display: inline;
    text-align: center;
}
</style>
<script type="text/javascript">
	$(function(){
		
		$('#home').click(function(){
			$(location).attr('href','/oxo/main.eat');		
		});
		
		//비밀번호찾기 버튼 숨기기
		$('#find').css('display','none');
		//비밀번호 찾기 버튼 클릭시 비밀번호 찾는 창으로 이동
		$('#find').click(function(){
			$(location).attr('href','/oxo/member/passFind.eat');
		});
		
		
		//이름과 이메일을 통해 아이디 찾기 
		$('#sm').click(function(){
			var cname = $('#name').val();
			var cemail = $('#email').val();

			$.ajax({
				url : "/oxo/member/idFindProc.eat",
				type : "post",
				dataType : "json",
				data : { "name" : cname, 
						"email" : cemail },
				success : function(data){
					if(data.id != null){
						//일치하면 아이디가 보여지고
						$('#idok').html('회원님의 아이디는 [ '+data.id+' ] 입니다.');
						//비밀번호 찾기 버튼도 보여짐
						$('#find').slideDown();
					}else{
						//이름과 이메일이 일치하지 않을 경우 나타나는 문구
						$('#idok').html('회원정보를 다시 확인해주세요.');
					}

					},
			error : function(){
				//이름과 이메일이 일치하지 않을 경우 나타나는 문구
				$('#idok').html('회원정보를 다시 확인해주세요.');
			}
			});
		});		
	});
	
</script>
</head>
<body>

<div class="container"></div>
    <div class="row-text-center">
        <div class="w3 col-3"></div>
         <div class="w3 col-6" style="float: none; margin: 8% auto; border: solid orange 2px;">
        <div>
            <div style="text-align: center;">
            <img src="/oxo/img/logo.png" width="50%" style="align-content: center; padding-top: 15px;">
            </div>
            <div style="padding:20px 20px 0px 20px; margin:0px 20px 0px 20px;">
                <div>
                    <input type="text" class="form-control inputheight " id="name" name="name" placeholder="Name">
                    <br>
                    <input type="text" class="form-control inputheight " id="email" name="email" placeholder="E-mail">
                    <br>
                    <b><p class="text-center text-warning" id="idok"><b>　</b></p></b>
                </div>
                
                <div>
                    <button type="button" class="btn btn-warning btn-w" id="sm">Submit</button>
                    <button type="button" class="btn btn-warning btn-w" style="float: right;" id="home">Home</button>
                </div>
                <div>
                	<button type="button" class="btn btn-warning btn-pass" id="find">Password Find</button>
                </div>
                <div style="display: inline-block; margin:0px;" class="row col-md-12">
                </div>
                <p class="text-muted text-center pt-1">Copyright © INEAT Corp. All Rights Reserved.</p>
            </div>
        </div>
    </div>
</div>


</body>
</html>