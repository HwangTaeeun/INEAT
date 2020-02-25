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
	var pw = '${param.msg}';
	$('#home').click(function(){
		$(location).attr('href','/oxo/main.eat');		
	});
	$('#pwalert').css('display','none');
	
	if("pwck"== pw){
		$('#pwalert').css('display','block');
		}
    $('#x').click(function() {
        $('#pwalert').css('display', 'none');
     });
     

	
/*
	$('#sm').click(function(){
		var email = $('#email').val();
		var pw = $('#pw').val();
		
		if(email!=null){
			if(pw!=null){
				//일치하면 메시지가 보여지고
				$('#passok').html('이메일 전송이 완료되었습니다.');
			}else{
				//메일전송 실패시 메시지가 보여지고
				$('#passok').html('회원정보를 다시 확인해주세요.');
		}
			
		}
	});
	
*/
});
</script>
</head>
<body>
<form method="post" action="/oxo/member/passFindProc.eat">
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
                    <input type="text" class="form-control inputheight " id="id" name="id" placeholder="ID">
                    <br>
                    <input type="text" class="form-control inputheight " id="name" name="name" placeholder="Name">
                    <br>
                    <input type="text" class="form-control inputheight " id="email" name="email" placeholder="E-mail">
<!--                     <input type="hidden" class="form-control inputheight " id="pw" name="pw" value=${EMAIL.email }>
                    
                    <b><p class="text-center text-warning" id="passok"><b>　</b></p></b>
                     -->
                    <input type="hidden" class="form-control inputheight " id="pw" name="pw" value=${MSG }>
                    <br>
                </div>
                
                <div>
                    <button type="submit" class="btn btn-warning btn-w" id="sm">Submit</button>
                    <button type="button" class="btn btn-warning btn-w" style="float: right;" id="home">Home</button>
                </div>
                <div style="display: inline-block; margin:0px;" class="row col-md-12">
                </div>
                <p class="text-muted text-center pt-1">Copyright © INEAT Corp. All Rights Reserved.</p>
            </div>
        </div>
    </div>
</div>
  <div id="pwalert" class="w3-modal">
	<div class="w3-modal-content alert alert-dismissible alert-warning col-4 container" >
	  <button type="button" class="close" data-dismiss="alert" id="x">&times;</button>
	  <h4 class="alert-heading">회원정보가 틀렸습니다!</h4>
	  <br>
	  <p class="mb-0">회원정보를 다시 확인해주세요.</p>
	</div>
</div>
</form>
</body>
</html>