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
    #bar{
        border-bottom:solid rgba(255, 166, 0, 0.7) 2px; 
        margin-top: -5px;
        width: 100%;
        float: right;
    }
    .btn-w{
    width: 20%;
}

#enname{
    width: 46%;
    margin-right: 60px;
}
.bt{
    position: absolute;
    right:40px;
}
.form-control{
    width: 60%;
    float: right;
    margin-top: -10px;
}
.form-control:focus{
    border:solid orange 2px;
  box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075), 0 0 8px rgba(255, 165, 0, 0.4)
}
#ennmsg{
	position:absolute;
	margin-top:10px;
	margin-left:205px;
}
#pic1{
border-radius: 50%
}
#pic2{
border-radius: 50%
}
</style>
<script type="text/javascript">
$(function(){
	$('#editInfo').css('display','none');
	$('#editBtn').click(function(){
		$('#editInfo').css('display', 'block');
	});
	
	//회원정보보기에서 메인으로 이동
	$('.cancel').click(function(){
		$(location).attr('href','/oxo/main.eat');
	});
	//회원정보수정닫기
	$('.ecancel').click(function(){
		$('#editInfo').css('display','none');
	});
	
    //닉네임체크
    $('#ennck').click(function(){
       var snn = $('#enname').val();
       
       $.ajax({
          url : "/oxo/member/nnCheck.eat",
          type : "post",
          dataType : "json",
          data : {"nname" : snn},
          success : function(cnt){
             var ck = cnt;
             if(ck==1){
                //아이디가 있는 경우
                $('#enname').val("");
                $('#ennmsg').attr('class','');
                $('#ennmsg').toggleClass('text-warning');
                $('#ennmsg').html("이미 사용된 닉네임입니다.");
             }else{
                //아이디가 없는 경우
                $('#ennmsg').attr('class','');
                $('#ennmsg').toggleClass('text-muted');
                $('#ennmsg').html("사용 가능한 닉네임입니다.");
             }
          },
          error : function(){
             alert('##에러');
          }
       });
    });
	
    //비밀번호 체크
    $('#epwck').keyup(function(){
    var pw = $('#epw').val();
    var pwck = $('#epwck').val();
    var msg = $('#epwmsg');
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
    $('#etel').keyup(function(){
       var tel = $('#etel').val();
       tel = tel.replace(/^(01[016789]{1}|02|0[3-9]{1}[0-9]{1})-?([0-9]{4})-?([0-9]{4})$/, "$1-$2-$3");
       $(this).val(tel);
    
    });


});
</script>
</head>
<body>
    <div class="container">
        <div class="row text-center">
            <div class="col-3"></div>
            <div class="col-6" id="detail" style="border: solid orange 8px; padding : 20px 20px 0px 20px; margin-top:10px;" width="200px" height="500px">
                <img src="/oxo/img/logo.png" width="50%">
                <div style="padding:40px;">
                
                    <div class="tel">
                        <h3 class="text-warning left text-left" style="margin-bottom: -20px;"><em>Profile</em></h3>
                        <c:if test='${DATA.rdCode == -1}'>
                        	<h6 class="text-muted right text-right"><img src="/oxo/upload/${param.PROF}" width="100px" height="100px" id="pic1"></h6>
                    	</c:if>
                       
                        <c:if test="${DATA.rdCode == 0}">
                        <h6 class="text-muted right text-right"><img src="/oxo/upload/${SNAME}" width="100px" height="100px" id="pic2"></h6>
                    	</c:if>

                    </div>
                    <br> 

                    <div class="name">
                        <h3 class="text-warning left text-left" style="margin-bottom: -20px;"><em>Name</em></h3>
                        <h6 class="text-muted right text-right" id="name">${DATA.name}</h6>
                        <div id="bar"></div>
                    </div>
                    <br> 
                    
                    <div class="nname">
                        <h3 class="text-warning left text-left" style="margin-bottom: -20px;"><em>Nick Name</em></h3>
                        <h6 class="text-muted right text-right" id="nname">${DATA.nname}</h6>
                        <div id="bar"></div>
                    </div>
                    <br> 

                    <div class="id">
                        <h3 class="text-warning left text-left" style="margin-bottom: -20px;"><em>ID</em></h3>
                        <h6 class="text-muted right text-right" id="id">${DATA.id}</h6>
                        <div id="bar"></div>
                    </div>
                    <br> 
                    
                    <div class="tel">
                        <h3 class="text-warning left text-left" style="margin-bottom: -20px;"><em>Tel</em></h3>
                        <h6 class="text-muted right text-right" id="tel">${DATA.tel}</h6>
                        <div id="bar"></div>
                    </div>
                    <br> 

                    
                    <div class="email">
                        <h3 class="text-warning left text-left" style="margin-bottom: -20px;"><em>Email</em></h3>
                        <h6 class="text-muted right text-right" id="email">${DATA.email}</h6>
                        <div id="bar"></div>
                    </div>
                    <br> 

                    <div class="bday">
                        <h3 class="text-warning left text-left" style="margin-bottom: -20px;"><em>Birth Day</em></h3>
                        <h6 class="text-muted right text-right" id="bday">${DATA.bday}</h6>
                        <div id="bar"></div>
                    </div>
                    <br> 
                    
                    <div class="jDate">
                        <h3 class="text-warning left text-left" style="margin-bottom: -20px;"><em>Join Date</em></h3>
                        <span><h6 class="text-muted right text-right" id="jDate">${DATA.sDate}</h6></span>
                        <div id="bar"></div>
                    </div>
                    <br> 
                    <div>
                        <button type="button" class="btn btn-w btn-warning" id="editBtn">Edit</button>
                        <button type="button" class="btn btn-w btn-warning cancel">Cancel</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <!-- 회원정보수정 모달창 -->
<form method="post" action="/oxo/member/editProc.eat"  enctype = multipart/form-data>
  <div id="editInfo" class="w3-modal">
      <div class="w3-modal-content" style="width:40%;">
         <div class="w3-container">
        <div class="row text-center">
            <div id="detail" style="border: solid orange 8px; padding : 20px; margin: 20px;" width="200px" height="500px">
                <img src="/oxo/img/logo.png" width="50%">
                <div style="padding:40px;  position:relative;">
                    
                    <div class="tel">
                        <h3 class="text-warning left text-left" style="margin-bottom: -20px;"><em>Profile</em></h3>
                        <h6 class="text-muted right text-right"><img src="/oxo/upload/${SNAME}" width="100px" height="100px" id="pic">
                        <small><input type="file" class="form-control-file right" id="exampleInputFile" name="sFile" aria-describedby="fileHelp"></small></h6>
                    </div>
                    <br> 

                    <div class="name">
                        <h3 class="text-warning left text-left" style="margin-bottom: -20px;"><em>Name</em></h3>
                        <h6 class="text-muted right text-right" id="ename" >${DATA.name }</h6>
                    </div>
                    <br> 

                    <div class="nname">
                        <h3 class="text-warning left text-left" style="margin-bottom: -20px;"><em>Nick Name</em></h3>
                        <input type="text" class="form-control inputheight" id="enname" name="nname" value="${DATA.nname }">
                        <button type="button" style ="float: right; margin-top:-5px;" class="btn btn-outline-warning btn-sm bt" id="ennck">Check</button>
                    </div>
     
                    <div>
                        <p><span class="float-right" style="font-size: 12px;" id="ennmsg"></span></p>
                    </div>
                    <br>


                    <div class="id">
                        <h3 class="text-warning left text-left" style="margin-bottom: -20px;"><em>ID</em></h3>
                        <h6 class="text-muted right text-right" id="eid">${DATA.id }</h6>
                        <input type="hidden" name="id" value="${DATA.id }">
                    </div>
                    <br> 

                    <div class="pw">
                        <h3 class="text-warning left text-left" style="margin-bottom: -20px;"><em>Password</em></h3>
                        <input type="password" class="form-control inputheight " id="epw" name="pw" value="${DATA.pw }">
                    </div>
                    <br><br>

                    <div class="pwck">
                        <h3 class="text-warning left text-left" style="margin-bottom: -20px;"><em>Password</em></h3>
                        <input type="password" class="form-control inputheight " id="epwck" value="${DATA.pw }">
                    </div>
                    <br>
                    <div>
                        <h6><span class="float-right" style="font-size: 12px;" id="epwmsg"></span></h6>
                    </div>
                    <br>
                    
                    <div class="tel">
                        <h3 class="text-warning left text-left" style="margin-bottom: -20px;"><em>Tel</em></h3>
                        <input type="text" class="form-control inputheight " id="etel" name="tel" value="${DATA.tel }">
                    </div>
                    <br><br>

                    
                    <div class="email">
                        <h3 class="text-warning left text-left" style="margin-bottom: -20px;"><em>Email</em></h3>
                        <input type="text" class="form-control inputheight " id="eemail" name="email" value="${DATA.email }">
                    </div>
                    <br> <br>

                    <div class="bday">
                        <h3 class="text-warning left text-left" style="margin-bottom: -20px;"><em>Birth Day</em></h3>
                        <h6 class="text-muted right text-right" id="ebday">${DATA.bday }</h6>
                    </div>
                    <br> 
                    
                    <div class="jDate">
                        <h3 class="text-warning left text-left" style="margin-bottom: -20px;"><em>Join Date</em></h3>
                        <span><h6 class="text-muted right text-right" id="ejDate">${DATA.sDate }</h6></span>
                    </div>
                    <br> 



                    <div>
                        <button type="submit" class="btn btn-w btn-warning eedit">Edit</button>
                        <button type="button" class="btn btn-w btn-warning ecancel">Cancel</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
         
  
      </div>
  </div>
</form>
</body>
</html>