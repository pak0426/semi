<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/views/inc/common.jsp"%>
<%
	String session_login_id = (String) request.getSession().getAttribute("LOGIN_ID");	
	String session_login_status = (String) request.getSession().getAttribute("LOGIN_STATUS");

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
// 		if($("#webtoon_title").val() == ""){
// 			alert("제목을 입력해주세요.");
// 			$("#webtoon_title").focus();
// 			return false;
// 		}
// 		if($("#webtoon_content").val() == ""){
// 			alert("내용을 입력해주세요.");
// 			$("#webtoon_content").focus();
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
                        <label for="webtoon_title">제목</label>
                        <input type="text" class="form-control" id="webtoon_title" name="webtoon_title" style="height:60px"/>
	                </div>
	                <div class="form-group">
                        <label for="firstname">요약</label>
                        <textarea class="form-control" id="webtoon_summary" name="webtoon_summary" style="height: 200px"></textarea>
	                </div>
	                <div class="form-group">
                        <label for="firstname">내용</label>
                        <textarea class="form-control" id="webtoon_content" name="webtoon_content" style="height: 200px"></textarea>
	                </div>
	                <div class="form-group">
                        <label for="firstname">작성자</label>
                        <input type="text" class="form-control" id="webtoon_author" name="webtoon_author" style="height:60px"/>
	                </div>
	                <div class="form-group">
	                	<label for="firstname">썸네일 이미지</label>
	                	<br/>
	                	<div class="spinner-border text-primary" role="status">
	                        <span class="visually-hidden">* 이미지 권장 사이즈 : 600 * 400</span>
	                	</div>
                        <br/>
	  				    <input class="form-control" type="file" id="formFile">
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