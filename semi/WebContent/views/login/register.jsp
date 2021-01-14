<%@page import="java.util.HashMap"%>
<%@ page  contentType="text/html;charset=utf-8"  pageEncoding = "utf-8" %>
<%@ page import="dao.member.MemberDAO"%>
<%@ include file="/views/inc/common.jsp"%>
<%-- <%@ include file="/views/inc/head.jsp"%> --%>

<%
	

	MemberDAO memberDAO = new MemberDAO();
	
	String type = request.getParameter("type");
	String isOk = request.getParameter("isOk");
	
%>
<!DOCTYPE html>
<html>
<script type="text/javascript">
	var type = "<%=type %>"; 
	var isOk = "<%=isOk %>"; 
	
	$(document).ready(function(){
		if(isOk == "N"){
			alert("등록하는데 문제가 발생했습니다.");
		}
		if(type="A" && isOk == "N"){
			alert("이미 사용 중인 ID입니다.");
		}
	});

	var setCount = 0;
	function setForm(){
		
		if($("#name").val() == ""){
			alert("이름을 입력해주세요.");
			$("#name").focus();
			return false;
		}
		if($("#id").val() == ""){
			alert("id를 입력해주세요.");
			$("#id").focus();
			return false;
		}
		if($("#email").val() == ""){
			alert("이메일을 입력해주세요.");
			$("#email").focus();
			return false;
		}
		if($("#password").val() == ""){
			alert("비밀번호를 입력해주세요.");
			$("#password").focus();
			return false;
		}
			
		$("#registerForm").submit();
	}

</script>
<head>
<link href="http://netdna.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet">
<link rel="shortcut icon" href="data:image/x-icon;," type="image/x-icon">
<link rel="shortcut icon" href="">

<meta charset="UTF-8">
<title>Insert title here</title>
<!-- <link type="text/css" rel="stylesheet" href="/res/css/bootstrap.map.css"> -->
<!-- <link type="text/css" rel="stylesheet" href="/res/css/bootstrap.min.css"> -->
<style type="text/css">
body{
    margin-top:20px;
    background-color: #f2f3f8;
}
.card {
    margin-bottom: 1.5rem;
    box-shadow: 0 1px 15px 1px rgba(52,40,104,.08);
}

.card {
    position: relative;
    display: -ms-flexbox;
    display: flex;
    -ms-flex-direction: column;
    flex-direction: column;
    min-width: 0;
    word-wrap: break-word;
    background-color: #fff;
    background-clip: border-box;
    border: 1px solid #e5e9f2;
    border-radius: .2rem;
}
</style>
</head>
<body>
	<div class="container h-100">
    		<div class="row h-100">
				<div class="col-sm-10 col-md-8 col-lg-6 mx-auto d-table h-100">
					<div class="d-table-cell align-middle">

						<div class="text-center mt-4">
							<h1 class="h2">Get started</h1>
							<p class="lead">
								Start creating the best possible user experience for you customers.
							</p>
						</div>

						<div class="card">
							<div class="card-body">
								<div class="m-sm-4">
									<form id="registerForm" name="registerForm" action="./register_action.jsp" method="post">
										<div class="form-group">
											<label>이름</label>
											<input class="form-control form-control-lg" type="text" id="name" name="name" placeholder="Enter your name">
										</div>
										<div class="form-group">
											<label>ID</label>
											<input class="form-control form-control-lg" type="text" id="id" name="id" placeholder="Enter your id">
										</div>
										<div class="form-group">
											<label>Email</label>
											<input class="form-control form-control-lg" type="email" id="email" name="email" placeholder="Enter your email">
										</div>
										<div class="form-group">
											<label>Password</label>
											<input class="form-control form-control-lg" type="password" id="password" name="password" placeholder="Enter password">
										</div>
									</form>
										<div class="text-center mt-3">
											<button type="button" class="btn btn-lg btn-default" onclick="location.href='./login.jsp'">back to home</button>
											<button type="submit" class="btn btn-lg btn-primary" onclick="setForm();">Sign up</button>
										</div>
								</div>
							</div>
						</div>

					</div>
				</div>
			</div>
		</div>
</body>
</html>