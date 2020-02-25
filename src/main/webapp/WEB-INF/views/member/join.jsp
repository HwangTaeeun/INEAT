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
.btn-w{
    width: 100px;
}
.form-control:focus {
   border: solid orange 2px;
   box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075), 0 0 8px
      rgba(255, 165, 0, 0.4)
}
</style>
<script type="text/javascript">
   $(function(){
	//메인으로 이동
	$('.cancel').click(function(){
		$(location).attr('href','/oxo/main.eat');
	});
	//아이디체크
    $('#idck').click(function(){
       var sid = $('#id').val();
       
       $.ajax({
          url : "/oxo/member/idCheck.eat",
          type : "post",
          dataType : "json",
          data : {"id" : sid},
          success : function(cnt){
             var ck = cnt;
             if(ck==1){
                //아이디가 있는 경우
                $('#id').val("");
                $('#idmsg').attr('class','');
                $('#idmsg').toggleClass('text-warning');
                $('#idmsg').html("이미 가입된 ID입니다.");
             }else{
                //아이디가 없는 경우
                $('#idmsg').attr('class','');
                $('#idmsg').toggleClass('text-muted');
                $('#idmsg').html("사용 가능한 ID입니다.");
             }
          },
          error : function(){
             alert('##에러');
          }
       });
    });
         
      //닉네임체크
      $('#nnck').click(function(){
         var snn = $('#nname').val();
         
         $.ajax({
            url : "/oxo/member/nnCheck.eat",
            type : "post",
            dataType : "json",
            data : {"nname" : snn},
            success : function(cnt){
               var ck = cnt;
               if(ck==1){
                  //아이디가 있는 경우
                  $('#nname').val("");
                  $('#nnmsg').attr('class','');
                  $('#nnmsg').toggleClass('text-warning');
                  $('#nnmsg').html("이미 사용된 닉네임입니다.");
               }else{
                  //아이디가 없는 경우
                  $('#nnmsg').attr('class','');
                  $('#nnmsg').toggleClass('text-muted');
                  $('#nnmsg').html("사용 가능한 닉네임입니다.");
               }
            },
            error : function(){
               alert('##에러');
            }
         });
      });
      
      
      
      //비밀번호 체크
      $('#pwck').keyup(function(){
      var pw = $('#pw').val();
      var pwck = $('#pwck').val();
      var msg = $('#pwmsg');
      if(pw==pwck){
         msg.html('비밀번호가 일치합니다.').css('color','gray');
      }
      if(pw!=pwck){
         msg.html('비밀번호가 일치하지 않습니다.').css('color','#fd8f00');
      }
      if(pw=="" || pwck==""){
         msg.html(" ");
      }
      
      });
      
      //전화번호 하이픈 자동입력
      $('#tel').keyup(function(){
         var tel = $('#tel').val();
         tel = tel.replace(/^(01[016789]{1}|02|0[3-9]{1}[0-9]{1})-?([0-9]{4})-?([0-9]{4})$/, "$1-$2-$3");
         $(this).val(tel);
      
      });
      
      
      //전화번호 체크
      $('#telck').click(function(){
         var stel = $('#tel').val();
         
         $.ajax({
            url : "/oxo/member/telCheck.eat",
            type : "post",
            dataType : "json",
            data : {"tel" : stel},
            success : function(cnt){
               var ck = cnt;
               if(ck==1){
                  //전화번호가 있는 경우
                  $('#tel').val("");
                  $('#telmsg').attr('class','');
                  $('#telmsg').toggleClass('text-warning');
                  $('#telmsg').html("이미 가입된 전화번호입니다.");
               }else{
                  //전화번호가 없는 경우
                  $('#telmsg').attr('class','');
                  $('#telmsg').toggleClass('text-muted');
                  $('#telmsg').html("사용 가능한 전화번호입니다.");
               }
            },
            error : function(){
               alert('##에러');
            }
         });
      });
      
      //이메일 정규식
      $('#eck').click(function(){            
         var eVal = $('#email').val();
         var regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
         var semail = $('#email').val();
         
         if(eVal.match(regExp) != null){
            $.ajax({
               url : "/oxo/member/eCheck.eat",
               type : "post",
               dataType : "json",
               data : {"email" : semail},
               success : function(cnt){
                  var ck = cnt;
                  if(ck==1){
                     //아이디가 있는 경우
                     $('#email').val("");
                     $('#emsg').attr('class','');
                     $('#emsg').toggleClass('text-warning');
                     $('#emsg').html("이미 가입된 이메일입니다.");
                  }else{
                     //이메일이 없는 경우
                     $('#emsg').attr('class','');
                     $('#emsg').toggleClass('text-muted');
                     $('#emsg').html("사용 가능한 이메일입니다.");
                  }
               },
               error : function(){
                  alert('##에러');
               }
            });
         }else{
            //이메일 형식이 잘못 된 경우
            $('#emsg').attr('class','');
            $('#emsg').toggleClass('text-warning');
            $('#emsg').html("이메일을 올바르게 입력하세요.");
         }
         
         
         //캔슬 클릭시 메인화면으로 이동
         $('.cancel').click(function(){
            $(location).attr('href','/oxo/main.eat');
         });  
      });      
   });
</script>
</head>
<body>

<body>
<form method="POST" action="/oxo/member/joinProc.eat">

    <div class="container">
        <div class="row text-center">
            <div class="col-3"></div>
            <div class="col-6" id="joinbox" style="border: solid orange 8px; padding : 20px; margin:20px;" width="200px" height="500px">
                    <img src="/oxo/img/logo.png" width="50%">
                    <div style="padding:20px;">
                    <div class="name">
                        <h4 class="text-warning left text-left" style="margin-bottom: 2px;"><em>Name</em></h4>
                        <input type="text" class="form-control inputheight" id="name" name="name">
                    </div>
                    <br>
                    <div class="id">
                        <h4 class="text-warning left text-left" style="margin-bottom: 2px;"><em>I D</em></h4>
                        <input type="text" class="form-control inputheight " id="id" name="id">
                        <div>
                        <h6><span class="" style="font-size: 12px; float:left;" id="idmsg"></span>
                        <button type="button" style ="float: right" class="btn btn-outline-warning btn-sm bt" id="idck">Check</button>
                        </h6>
                        </div>
                    </div>
                    <br>
                    <div class="pw">
                        <h4 class="text-warning left text-left" style="margin-bottom: 2px;"><em>Password</em></h4>
                        <input type="password" class="form-control inputheight" id="pw" name="pw">
                    </div>
                    <br>
                    <div class="pwck">
                        <h4 class="text-warning left text-left" style="margin-bottom: 2px;"><em>Password Check</em></h4>
                        <input type="password" class="form-control inputheight" id="pwck" name="pwck">
                        <div>
                        <h6><span class="float-left" style="font-size: 12px;" id="pwmsg"></span>
                        </h6>
                        </div>
                    </div>
                    <br>
                    <div class="nick">
                        <h4 class="text-warning left text-left " style="margin-bottom: 2px;"><em>Nick-name</em></h4>
                        <input type="text" class="form-control inputheight" id="nname" name="nname">
                        <div>
                        <h6><span class="" style="font-size: 12px; float:left;" id="nnmsg"></span>
                        <button type="button" style ="float: right" class="btn btn-outline-warning btn-sm bt" id="nnck">Check</button>
                        </h6>
                        </div>
                    </div>
                    <br>
                    <div class="tel">
                            <h4 class="text-warning left text-left" style="margin-bottom: 2px;"><em>Tel</em></h4>
                            <input type="text" class="form-control inputheight" id="tel" name="tel">
                            <div>
                            <h6><span class="" style="font-size: 12px; float:left;" id="telmsg"></span>
                            <button type="button" style ="float: right" class="btn btn-outline-warning btn-sm bt" id="telck">Check</button>
                            </h6>
                            </div>
                     </div>
                     <br>
                    <div class="email">
                            <h4 class="text-warning left text-left" style="margin-bottom: 2px;"><em>E-mail</em></h4>
                            <input type="text" class="form-control inputheight" id="email" name="email">
                            <div>
                            <h6><span class="" style="font-size: 12px; float:left;" id="emsg"></span>
                            <button type="button" style ="float: right" class="btn btn-outline-warning btn-sm bt" id="eck">Check</button>
                            </h6>
                            </div>
                     </div>
                     <br>
                    <div class="birth">
                            <h4 class="text-warning left text-left" style="margin-bottom: 2px;"><em>Birthday</em></h4>
                            <input type="text" class="form-control inputheight" id="bday" name="bday">                            
                     </div>
                     </div>
                    <br>
                    <div>
                        <button type="submit" class="btn btn-w btn-warning">Join</button>
                        <button type="button" class="btn btn-w btn-warning cancel">Cancel</button>
                    </div>
            </div>
        </div>
    </div>
</form>
</body>
</html>