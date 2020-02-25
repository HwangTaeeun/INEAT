<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>맛집 상세보기</title>
	<link rel="stylesheet" href="/oxo/css/w3.css">
    <link rel="stylesheet" href="/oxo/css/bootstrap.min.css" media="screen">
	<link rel="stylesheet" href="/oxo/css/nav.css">
    <script src="/oxo/js/popper.min.js"></script>
    <script src="/oxo/js/jquery.min.js"></script>
    <script src="/oxo/js/bootstrap.min.js"></script>
    <style>
        .m0 {
            margin: 0;
        }
        .bg {
            background-color: rgba(255, 255, 255, 1);
            border-color: rgba(214, 214, 214, 1);
            ;
        }
        .listtop {
            padding-bottom: 5px;
            margin: 0 auto;
            border-bottom: 1px solid #dbdbdb;
            position: relative;
        }
        .listcommon {
            position: absolute;
            right: 0;
        }
        .listcommon div {
            margin: auto 5px;
        }
        .bbg {
            border-bottom: solid 1px #dbdbdb;
            width: 950px;
            margin: 0 auto;
            padding: 10px 0;
        }
        .info {
            border-collapse: separate;
            border-spacing: 0 10px;
            margin: 25px 0;
        }
        .info td {
            padding-left: 50px;
        }
        .imgbox {
            width: 60px;
            height: 60px;
            border-radius: 50%;
            overflow: hidden;
        }
        .pic_1 {
            display: inline-block;
            position: relative;
            width: 130px;
            height: 130px;
            overflow: hidden;
            margin: 1px;
        }
        .pic {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }
        .blurEffect {
            filter: brightness(30%);
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
        .galls{
	        overflow-x: auto;
		    white-space: nowrap;
		    width: 90%;
		    margin: 0 auto;
        }
  		.pointStarRating {
 		    position: relative;
			width: 74px;
		    height: 12px;
		    overflow: hidden;
		    display: inline-block;
		    vertical-align: top;
		    margin: 1px 0 0 0;
		    padding-left: 1px;
		    background: url(/oxo/img/sp_ico3.png) no-repeat;
		    background-position: 0 -154px;
		}
		.pointStarCover{
			height:100%;
		    overflow: hidden;
		    position: absolute;
		    top: 0;
		    left: 0;
		    z-index: 10;
		    background: url(/oxo/img/sp_ico3.png) no-repeat;
		    background-position: 0 -140px;
		    text-indent: -9999px;
		}
		.btns{
			display:none;
		    bottom: 0;
		    position: absolute;
		    left: 50%;
		    transform: translateX(-50%);
		}
		.favorite, .loginpls{
			width:35px;
			cursor:pointer;
			height:35px;
		    right: 0;
		}
    </style>

    <script>
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
////////////////////////////////////////////////////////////////////////////////////////////
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
		            	if(fav.find('img').attr('src').includes("favorite2")) {
		    				fav.find('img').attr('src','/oxo/img/favorite.png');
		    				fav.removeClass('f_in');
		    				fav.addClass('f_out');
		    			}else {
		    				fav.find('img').attr('src','/oxo/img/favorite2.png');
		    				fav.removeClass('f_out');
		    				fav.addClass('f_in');
		    			}
		            },
		            error : function(){
		               alert('###에러');
		            }
				});
			});
			
            $('.gallery').each(function () {
                if ($('div', this).length > 6) {
                    var gal = $(this).children().eq(4);
                    var count = gal.nextAll().length;
                    gal.nextAll().css("display", "none");
                    gal.children('img').addClass('blurEffect');
                    gal.append( '<b></b>' );
                    gal.children('b').text("+"+count);
                    gal.children('b').addClass('overindex');
                }
            });
            
            $(document).on('mouseenter', '.reviews', function(e) {
    			e.stopImmediatePropagation();
    			$(this).css('background', '#8080801a');
    			$(this).children('.text-center').children('.btns').css('display', 'block');
    		});

    		$(document).on('mouseleave', '.reviews', function(e) {
    			e.stopImmediatePropagation();
    			$(this).css('background', '0');
    			$(this).children('.text-center').children('.btns').css('display', 'none');
    		});
    		
    		
    		$('.del').click(function(){
    			var review = $(this);
    			var rvno = review.attr('data-id');
    			if(confirm('정말 삭제하시겠습니까?') == true){
    				$.ajax({
    					url : "/oxo/ineatlist/review/delreview.eat",
    					type : "post",
    					dataType : "json",
    					data : {
    						rv_no : rvno
    					}
    				});
				review.parents('.reviews').remove();
    			}else{
    				return;
    			}
    		});
    		
    		$('.fix').click(function(){
    			var rvno = $(this).attr('data-id');
    			$(location).attr('href','/oxo/ineatlist/review/fixreview.eat?rv_no='+rvno);
    		});
        });
    </script>
    
    
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=de1101f28afb5244853fcd07238b684b&libraries=services"></script>

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
              	</ul>
              </li>
         </ul>
      </div>
   </nav>
   <!--네비게이션바-->
    <div class="container" style="margin-top: 100px;">
        <!-- 탑인포영역 -->
        <div class="row m0 pb-3 bbg">
            <div class="detail col-8 p-0 pr-3">

                <!-- 해더 -->
                <div class="header d-flex position-relative">
                    <h2><b>${TVO.ml_title}</b></h2>
                    <span class="ml-3 text-success"><h2><b>${AVG}</b></h2></span>
                    <c:choose>
						<c:when test="${TVO.favorite eq '0'}">
							<div class="favorite f_in position-absolute" data-id="${TVO.ml_no }">
								<img src="/oxo/img/favorite2.png" style="width: 100%;">
							</div>
						</c:when>
						<c:when test="${TVO.favorite eq '1'}">
							<div class="favorite f_out position-absolute" data-id="${TVO.ml_no }">
								<img src="/oxo/img/favorite.png" style="width: 100%;">
							</div>
						</c:when>
						<c:otherwise>
							<div class="loginpls position-absolute">
								<img src="/oxo/img/favorite2.png" style="width: 100%;">
							</div>
						</c:otherwise>
					</c:choose>
                </div>

                <!-- 탑 -->
                <div class="listtop d-flex">
                    <div>ㅇ조회수 : <span>${TVO.ml_count }</span> </div>
                    <div class="ml-3">ㅇ추천수 : <span>${TVO.fvrcnt}</span> </div>
                    <div class="ml-3">ㅇ리뷰수 : <span>${CNT} </span> </div>
                    <div class="listcommon">
                        <div>2019-12-27</div>
                    </div>
                </div>

                <!-- 센터 -->
                <table class="info mb-0">
                    <tbody>
                        <tr>
                            <th>주소</th>
                            <td>${TVO.ml_newaddr }</td>
                        </tr>
                        <tr>
                            <th>대표메뉴</th>
                            <td>${TVO.ml_menu }</td>
                        </tr>
                        <tr>
                            <th>가격대</th>
                            <td>${TVO.ml_price }</td>
                        </tr>
                        <tr>
                            <th>연락처</th>
                            <td>${TVO.ml_tel }</td>
                        </tr>
                        <tr>
                            <th>영업시간</th>
                            <td>${TVO.ml_time }</td>
                        </tr>
                    </tbody>
                </table>
                <form action="/oxo/ineatlist/review/reviewform.eat" method="post" class="float-right">
                	<input type="hidden" name="ml_no" id="mlno" value="${TVO.ml_no }">
                	<c:if test="${not empty SID }">
	                	<button class="btn btn-danger" id="addreview">리뷰작성</button>
	                </c:if>
                </form>
                
            </div>
            <!-- 지도영역 -->
            <div style="background-color: aqua;" class="col-4" id="map"></div>
        </div>
        <!-- 탑인포영역 종료 -->
        
        <!-- 갤러리영역 -->
        <div class="row m0 bbg">
            <div class="text-center galls">
				<c:forEach var="data3" items="${IMGS}">
					<div class="pic_1">
						<img src="/oxo/upload/${data3}" class="pic">
					</div>
				</c:forEach>
			</div>
        </div>
        <!-- 갤러리영역 종료 -->



        <!-- 리뷰영역 -->
        <c:forEach var="data" items="${RV_LIST}">
        <div class="row m0 bbg reviews">
            <!-- 아바타 이미지 /아이디 -->
            <div class="col-10 d-flex mb-3">
                <div class="text-center mt-3">
                    <div class="imgbox">
                        <img src="/oxo/upload/${data.profile }"
                            alt="avt" class="pic">
                    </div>
                    <span>${data.m_id }</span>
                </div>
				
                <!-- 리뷰내용 -->
                <div class="ml-4">
                    <p class="mb-1">${data.rv_date }</p>
                    <p class="mb-1">${data.rv_body }</p>
                    <div class="gallery">
                    
                    	<c:forEach var="data2" items="${data.rf_savename }">
	                        <div class="pic_1">
	                            <img src="/oxo/upload/${data2}" class="pic">
	                        </div>
                        </c:forEach>
                        
                    </div>
                </div>
                
            </div>
			
            <!-- 등록점수 -->
            <div class="col-2 text-center">
                <h1 class="text-success"><b>${data.rv_score}</b></h1>
                <span class="pointStarRating">
                	<span class="pointStarCover" style="width:${data.rv_score*20}%;"></span>
                </span>
                <c:if test="${SID eq data.m_id}">
                <div class="btns">
	            	<button type="button" class="btn btn-info btn-sm fix" data-id="${data.rv_no }">수정</button>
	            	<button type="button" class="btn btn-danger btn-sm del" data-id="${data.rv_no }">삭제</button>
            	</div>
            	</c:if>
            	
            </div>
            
        </div>
        <!-- 리뷰영역 종료 -->
        </c:forEach>
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
    
<!-- 지도api -->
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

// 주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();

// 주소로 좌표를 검색합니다
geocoder.addressSearch('${TVO.ml_newaddr }', function(result, status) {

    // 정상적으로 검색이 완료됐으면 
     if (status === kakao.maps.services.Status.OK) {

        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

        // 결과값으로 받은 위치를 마커로 표시합니다
        var marker = new kakao.maps.Marker({
            map: map,
            position: coords
        });

        // 인포윈도우로 장소에 대한 설명을 표시합니다
        var infowindow = new kakao.maps.InfoWindow({
            content: '<div style="width:150px;text-align:center;padding:6px 0;">${TVO.ml_title }</div>'
        });
        infowindow.open(map, marker);

        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
        map.setCenter(coords);
    } 
});    
</script>

</body>
</html>