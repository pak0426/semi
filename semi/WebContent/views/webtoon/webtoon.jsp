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
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
body{
    background:#eee;    
}
.main-box.no-header {
    padding-top: 20px;
}
.main-box {
    background: #FFFFFF;
    -webkit-box-shadow: 1px 1px 2px 0 #CCCCCC;
    -moz-box-shadow: 1px 1px 2px 0 #CCCCCC;
    -o-box-shadow: 1px 1px 2px 0 #CCCCCC;
    -ms-box-shadow: 1px 1px 2px 0 #CCCCCC;
    box-shadow: 1px 1px 2px 0 #CCCCCC;
    margin-bottom: 16px;
    -webikt-border-radius: 3px;
    -moz-border-radius: 3px;
    border-radius: 3px;
}
.table a.table-link.danger {
    color: #e74c3c;
}
.label {
    border-radius: 3px;
    font-size: 0.875em;
    font-weight: 600;
}
.user-list tbody td .user-subhead {
    font-size: 0.875em;
    font-style: italic;
}
.user-list tbody td .user-link {
    display: block;
    font-size: 1.25em;
    padding-top: 3px;
    margin-left: 60px;
}
a {
    color: #3498db;
    outline: none!important;
}
.user-list tbody td>img {
    position: relative;
    max-width: 50px;
    float: left;
    margin-right: 15px;
}

.table thead tr th {
    text-transform: uppercase;
    font-size: 0.875em;
}
.table thead tr th {
    border-bottom: 2px solid #e7ebee;
}
.table tbody tr td:first-child {
    font-size: 1.125em;
    font-weight: 300;
}
.table tbody tr td {
    font-size: 0.875em;
    vertical-align: middle;
    border-top: 1px solid #e7ebee;
    padding: 12px 8px;
}
a:hover{
text-decoration:none;
}
</style>
</head>
<body>
<hr>
<div class="container bootstrap snippets bootdey m-auto">
	<%@ include file="../inc/top.jsp" %>
    <div class="row">
        <div class="col-lg-12">
        	<div class="btn-wrap text-right pb-3">
	        	<button type="submit" class="btn btn-lg btn-primary" onclick="location.href='./write.jsp'">글 작성</button>
        	</div>
            <div class="main-box clearfix">
                <div class="main-box-body clearfix">
                    <div class="table-responsive" >
                        <table class="table user-list">
                            <thead>
                                <tr>
                                <th><span>글 번호</span></th>
                                <th><span>글 제목</span></th>
                                <th><span>Created</span></th>
                                <th><span>Status</span></th>
                                <th><span>Email</span></th>
                                <th>&nbsp;</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>
                                        <img src="https://bootdey.com/img/Content/user_1.jpg" alt=""> <!-- 썸네일 이미지 -->
                                        <a href="#" class="user-link">Full name 1</a>
                                        <span class="user-subhead">Member</span>
                                    </td>
                                    <td>2013/08/12</td>
                                    <td>
                                        <span class="label label-default">pending</span>
                                    </td>
                                    <td>
                                        <a href="#">marlon@brando.com</a>
                                    </td>
                                    <td style="width: 20%;">
                                        <a href="#" class="table-link text-warning">
                                            <span class="fa-stack">
                                                <i class="fa fa-square fa-stack-2x"></i>
                                                <i class="fa fa-search-plus fa-stack-1x fa-inverse"></i>
                                            </span>
                                        </a>
                                        <a href="#" class="table-link text-info">
                                            <span class="fa-stack">
                                                <i class="fa fa-square fa-stack-2x"></i>
                                                <i class="fa fa-pencil fa-stack-1x fa-inverse"></i>
                                            </span>
                                        </a>
                                        <a href="#" class="table-link danger">
                                            <span class="fa-stack">
                                                <i class="fa fa-square fa-stack-2x"></i>
                                                <i class="fa fa-trash-o fa-stack-1x fa-inverse"></i>
                                            </span>
                                        </a>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>