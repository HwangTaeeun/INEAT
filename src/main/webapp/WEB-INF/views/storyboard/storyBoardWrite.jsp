<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>story board write</title>
<script type="text/javascript" src="/oxo/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="/oxo/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="/oxo/css/bootstrap.min.css">
<style>

</style>

<script type="text/javascript">
$(function(){
	// 스토리보드로 돌아가기
	$('#cancel').click(function(){
		location.href = "/oxo/storyboard/storyBoard.eat";
	});
	// 작성하기
	function content(){
		var title = $('#title').val();
		var content = $('#content').val();
		
		if(!title && !content){
			alert('내용을 작성해 주세요.');
			return;
		}
		$('#form1').submit();
	}
	$('#write').click(content);
	
	// 글자 제한
    $('#content').on('keyup', function() {
        if($(this).val().length > 1000) {
            $(this).val($(this).val().substring(0, 1000));
        }
    });
    
   

});
</script>
</head>
<body>



	<div class="container-fluid">
		<div class="row mt-3 text-center">
	        <div class="col-md-2"></div>
	        <div class="col-md-8 text-warning font-italic"><h1>writing in inEat Story</h1></div>
	    </div>
	    <div class="row mt-3 text-center">
	        <div class="col-md-2"></div>
	        <div class="col-md-8 border-bottom"  ></div>
	    </div>
	    <form id="form1" method="post" action="/oxo/storyboard/storyBoardWriteProc.eat" enctype="multipart/form-data" class="kor2">
		    <div class="row mt-2">
		        <div class="col-md-2"><input type="hidden" name="mid" value="${SID }"></div>
		        <div class="col-md-1 text-center">제목</div>
		        <div class="col-md-6"><input type="text" id="title" name="title" style="width:100%" value="" maxlength="100"></div>
		    </div>
		    <div class="row mt-2">
		        <div class="col-md-2"></div>
		        <div class="col-md-1 text-center">내용</div>
		        <div class="col-md-6"><textarea id="content" name="content" cols="150" rows="10" style="width:100%"></textarea></div>
		    </div>
		    <div class="row mt-2">
		        <div class="col-md-2"></div>
		        <div class="col-md-1 text-center">파일</div>
		        <div class="col-md-6">
					<input type="file" name="sFile">
		        </div>
		        <div class="col-md-1"></div>
		    </div>
	    </form>
	    
	    <div class="row mt-4 kor2">
	        <div class="col-md-2"></div>
	        <div class="col-md-6"></div>
	        <div class="col-md-2">
	        	<div class="btn-group" role="group">
	        		<button type="button" id="cancel" class="btn btn-warning">취소</button>
	        		<button type="button" id="write" class="btn btn-warning">작성하기</button>
	        	</div>
	        </div>
	    </div>
	</div>	
</body>
</html>