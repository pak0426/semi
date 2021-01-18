<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/views/inc/common.jsp"%>
<%	
String session_login_id = "";
String session_login_status = "";

if(request.getSession().getAttribute("LOGIN_ID") != null && request.getSession().getAttribute("LOGIN_STATUS") != null){
	session_login_id = (String) request.getSession().getAttribute("LOGIN_ID");	
	session_login_status = (String) request.getSession().getAttribute("LOGIN_STATUS");
	
	if(session_login_status.equals("Y")){
		//${}에 저장해준다. 
		request.setAttribute("session_login_id", session_login_id);
		request.setAttribute("session_login_status", session_login_status);
	}
}
%>
<!DOCTYPE html>
<html>
<link href="http://netdna.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet">
<link type="text/css" rel="stylesheet" href="/res/css/base.css">
<head>
<style type="text/css">
body{
    color: #8e9194;
    background-color: #f4f6f9;
}
.avatar-xl img {
    width: 110px;
}
.rounded-circle {
    border-radius: 50% !important;
}
img {
    vertical-align: middle;
    border-style: none;
}
.text-muted {
    color: #aeb0b4 !important;
}
.text-muted {
    font-weight: 300;
}
.form-control {
    display: block;
    width: 100%;
    height: calc(1.5em + 0.75rem + 2px);
    padding: 0.375rem 0.75rem;
    font-size: 0.875rem;
    font-weight: 400;
    line-height: 1.5;
    color: #4d5154;
    background-color: #ffffff;
    background-clip: padding-box;
    border: 1px solid #eef0f3;
    border-radius: 0.25rem;
    transition: border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
}
</style>
<script type="text/javascript">
	function setForm(){
		console.log("test");
// 		if($("#board_title").val() == ""){
// 			alert("제목을 입력해주세요.");
// 			$("#board_title").focus();
// 			return false;
// 		}
// 		if($("#board_content").val() == ""){
// 			alert("내용을 입력해주세요.");
// 			$("#board_content").focus();
// 			return false;
// 		}
			
		$("#writeForm").submit();
	}
</script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="container bootstrap snippets bootdey m-auto">
	<%@ include file="../inc/top.jsp" %>
	<div class="row justify-content-center">
	    <div class="col-lg-12">
	        <h2 class="h3 mb-4 page-title">write</h2>
	        <div class="my-4">
	            <form class="form-horizontal" id="writeForm" name="writeForm" action="./write_action.jsp" method="post">
	                <hr class="my-4" />
	                <div class="form-group">
                        <label for="board_title">제목</label>
                        <input type="text" class="form-control" id="board_title" name="board_title"/>
	                </div>
	                <div class="form-group">
                        <label for="firstname">요약</label>
                        <textarea rows="" cols="" class="form-control" id="board_summary" name="board_summary"></textarea>
	                </div>
	                <div class="form-group">
                        <label for="firstname">내용</label>
                        <textarea rows="" cols="" class="form-control" id="board_content" name="board_content"></textarea>
	                </div>
	                <div class="form-group">
                        <label for="firstname">작성자</label>
                        <input type="text" class="form-control" id="board_author" name="board_author"/>
	                </div>
	                <div class="form-group">
	                	<label for="firstname">썸네일 이미지</label>
	                	<br/>
                        <span>* 이미지 권장 사이즈 : 600 * 400</span><br/>
						<input type="file" id="addthum" name="addthum">
	                </div>
	                <div class="form-group">
	                	<label for="firstname">사용 여부</label>
                        <label><input type="radio" id="use_y" name="use_yn" value="Y" checked/>&nbsp;사용</label>&nbsp;&nbsp;&nbsp;
						<label><input type="radio" id="use_n" name="use_yn" value="N" />&nbsp;미사용</label>
	                </div>
	            </form>
                <button type="submit" class="btn btn-primary" onclick="setForm();">저장</button>
	        </div>
	    </div>
	</div>
</div>
</body>
</html>