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
   		var id = '${SID}';
   		$('#memInfo').click(function(){
   			$(location).attr('href','/oxo/member/memInfo.eat?id='+id);
   		});
      });
  
  
  $(function() {
      //네비바 로고 클릭 시 메인화면으로 이동
      $('.navbar-brand').click(function() {
         $(location).attr('href', '/oxo/main.eat');
      });
   });
  
  
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