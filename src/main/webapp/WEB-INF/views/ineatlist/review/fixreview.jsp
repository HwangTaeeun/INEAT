<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>리뷰수정</title>
	<link rel="stylesheet" href="/oxo/css/w3.css">
    <link rel="stylesheet" href="/oxo/css/bootstrap.min.css" media="screen">
    <link rel="stylesheet" href="/oxo/css/nav.css">
    <link rel="stylesheet" href="/oxo/css/fixreview.css">
    <script src="/oxo/js/popper.min.js"></script>
    <script src="/oxo/js/jquery.min.js"></script>
    <script src="/oxo/js/bootstrap.min.js"></script>
    
    <script type="text/javascript">
        $(function () {
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
  ///////////////////////
			
  			$('#cancle').click(function(){
  				var no = $(this).attr('data-id');
   	   			$(location).attr('href','/oxo/ineatlist/info.eat?ml_no='+no);
   	   		});
            $('.pointStarRating>div:odd').css('width', '19px');

            $('.reviewarea').each(function () {
                this.setAttribute('style', 'height:' + (this.scrollHeight) + 'px;overflow-y:hidden;');
            }).on('input', function () {
                this.style.height = '150px';
                this.style.height = (this.scrollHeight) + 'px';
            });
            
			var bool = true;
            var c_score = '${RVO.rv_score}';
            var c_index;
            
            $('#sc').text(c_score);
            
            $('.pointStarlist').click(function() {
                c_star = $(this);
                c_index = c_star.index();
                bool = false;
                c_score = $(this).attr('data-id');
                $('#score').val(c_score);
            });

            $('.pointStarlist').mouseenter(function () {
                var star = $(this);
                var t_score = $(this).attr('data-id');
                $('#sc').text(t_score);
                var t_index = star.index();
                if ((t_index % 2) == 0) {
                    // 짝수이면
                    star.css('background-position', '-1px -1031px');
                } else {
                    // 홀수이면
                    star.css('background-position', '-13px -1031px');
                }
                star.prevAll('.odd').css('background-position', '-1px -1031px');
                star.prevAll('.even').css('background-position', '-13px -1031px');
                star.nextAll().css('background-position', '0 -9999px');
            });

            $('.pointStarRating').mouseleave(function () {
                if (bool == true) {
                	$('#sc').text(0);
                    $('.pointStarlist').css('background-position', '0 -9999px');
                } else {
                    $('.pointStarlist').css('background-position', '0 -9999px');
                    if ((c_index % 2) == 0) {
                        c_star.css('background-position', '-1px -1031px');
                    } else {
                        c_star.css('background-position', '-13px -1031px');
                    }
                    c_star.prevAll('.odd').css('background-position', '-1px -1031px');
                    c_star.prevAll('.even').css('background-position', '-13px -1031px');
                    c_star.nextAll().css('background-position', '0 -9999px');
                	$('#sc').text(c_score);
                }
            });
            
///////////////////////////////////////////////////////////////////////////////////////////////
            $('#ck').click(function(){
            	var f_value = $('#f1').val();
            	if(f_value ==""){
            		console.log('비어있음');
            	}
            });
            
    			var cnt = 0;
            $(document).on('click', '.up_pic_1', function(e) {
    			e.stopImmediatePropagation();
    			var val = $('#file_box>input:last').val();
    			alert(val);
    			
    			if(val == '' || val == undefined){
    				$('#file_box>input:last').remove();
    			}else{
    				cnt += 1;
    			}
   				var inputfile = '<input type="file" class="form-control-file files" name="sfile" id="f'+cnt+'">';
            	$('#file_box').append(inputfile);
    			var f_id = "#f"+cnt;
    			$(f_id).click();
            });
            
            $(document).on('change', '.files' , function(e) {
            	e.stopImmediatePropagation();
            	var tmp = URL.createObjectURL(e.target.files[0]);
            	console.log(tmp);
            	var resultlist ='';
            	resultlist +='<div class="inimg pic_1 ml-2" data-id="#f'+cnt+'">';
            	resultlist +='<img src="'+tmp+'" class="pic up_pic">';
            	resultlist +='<span class="up_del_pic">X</span>';
            	resultlist +='</div>';
            	$('.up_pic_1').before(resultlist);
            });
            
            $(document).on('mouseenter', '.inimg', function(e) {
            	e.stopImmediatePropagation();
            	$(this).find('img').addClass('blurEffect');
            	$(this).find('img').css('cursor','auto');
            	$(this).find('span').css('display','block');
            });
            
            $(document).on('mouseleave', '.inimg', function(e) {
            	e.stopImmediatePropagation();
            	$(this).find('img').removeClass('blurEffect');
            	$(this).find('img').css('cursor','pointer');
            	$(this).find('span').css('display','none');
            });
            
            $(document).on('click', '.del_pic', function(e) {
            	e.stopImmediatePropagation();
            	$(this).parents('.pic_1').remove();
            	var savename = $(this).attr('data-id');
            	var del_file = '<input type="text" name="rf_savename" value="'+savename+'">';
            	$('#del_file_box').append(del_file);
            });
            
            $(document).on('click', '.up_del_pic', function(e) {
            	e.stopImmediatePropagation();
            	var inputid = $(this).parents('.pic_1').attr('data-id');
            	alert(inputid);
            	$(this).parents('.pic_1').remove();
            	$(inputid).remove();
            });
            
        });
        function reviewsubmit(){
        	$('.files:last').remove();
        	$('#reviewfrm').submit();
        }
    </script>
</head>

<body>
    <!-- 메인 -->
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
            <div class="col-12">
                <div class="" style="width: 700px; margin: 0 auto;">
                    <h3> <b class="text-warning">리뷰 수정</b> </h3>
                    <div class="d-flex">
	                    <div class="pointStarRating d-flex">
	                        <div class="pointStarlist odd" data-id="0.5"></div>
	                        <div class="pointStarlist even" data-id="1.0"></div>
	                        <div class="pointStarlist odd" data-id="1.5"></div>
	                        <div class="pointStarlist even" data-id="2.0"></div>
	                        <div class="pointStarlist odd" data-id="2.5"></div>
	                        <div class="pointStarlist even" data-id="3.0"></div>
	                        <div class="pointStarlist odd" data-id="3.5"></div>
	                        <div class="pointStarlist even" data-id="4.0"></div>
	                        <div class="pointStarlist odd" data-id="4.5"></div>
	                        <div class="pointStarlist even" data-id="5.0"></div>
	                    </div>
                        <div class="starscore mr-2"><h3><b id="sc">0</b></h3></div>
                    </div>
                    <div>
                    
                        <form class="wrap" enctype="multipart/form-data" method="post" action="/oxo/ineatlist/review/fixreviewproc.eat" id="reviewfrm">
                            <input type="hidden" id="score" name="rv_score" value="${RVO.rv_score}">
                            <input type="hidden" id="mlno" name="rv_mlno" value="${RVO.rv_mlno}">
                            <input type="hidden" id="mlno" name="rv_no" value="${RVO.rv_no}">
                            <div id="file_box" style="display: none;">
                            </div>
                            <div id="del_file_box" style="display: none;">
                            	
                            </div>
                            	
                           	<!-- 텍스트 박스 -->
                            <textarea name="rv_body" class="p-3 mt-3 mb-3 reviewarea" placeholder="리뷰 내용을 작성해 주세요" maxlength="1000">${RVO.rv_body }</textarea>
                            <div class="gallery" id="gall">
                            
                       			<c:forEach var="data" items="${RVO.rf_savename }">
                   				<div class="inimg pic_1 ml-2">
                       				<img src="/oxo/upload/${data }" class="pic up_pic">
                       				<span class="del_pic" data-id="${data }">X</span>
                                </div>
                       			</c:forEach>
                       			
                        		<div class="up_pic_1 ml-2">
                            		<img src="/oxo/img/moreimg.png" class="pic">
                                </div>
                        	</div>
                        	
                            <div class="text-right">
                                <button type="button" id="cancle"class="btn btn-secondary btn-lg" data-id="${RVO.rv_mlno}"> 취소 </button>
                                <button type="button" class="btn btn-warning btn-lg ml-3" onclick="reviewsubmit()"> 글 작성 완료</button>
                            </div>
                        </form>
                        
                    </div>
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