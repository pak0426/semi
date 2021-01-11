<%@ page  contentType="text/html;charset=utf-8"  pageEncoding = "utf-8" %>
<%@page import="java.util.*"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="org.apache.ibatis.session.SqlSessionFactory"%>
<%@ page import="dao.mybatis.SqlSessionManager" %>
<%@ include file="/views/inc/head.jsp"%>
<!doctype html>
<%
// 	SqlSessionManager.getInstance();

	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getInstance();
	SqlSession sqlSession = sqlSessionFactory.openSession();
	
	try {
		
		List list = sqlSession.selectList("Webtoon.getWebtoonList");
		
		HashMap rtnMap = new HashMap();
		
		if(list.size() > 0){
			for(int i=0; i<list.size(); i++){
				rtnMap = (HashMap)list.get(i);
			}
		}
		
// 		out.println("WEBTOON_SUMMARY" + rtnMap.get("WEBTOON_SUMMARY"));
	}catch(Exception e){
		e.printStackTrace();
	}
%>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="/docs/4.0/assets/img/favicons/favicon.ico">

    <title>login Form</title>
    

    <link rel="canonical" href="https://getbootstrap.com/docs/4.0/examples/sign-in/">


    <style type="text/css">
    body{margin-top:20px;}              
	.modal-footer {   border-top: 0px; }
    </style>    
  </head>

  <body class="text-center">
   <div id="loginModal" class="modal show" tabindex="-1" role="dialog" aria-hidden="true">
  <div class="modal-dialog">
  <div class="modal-content">
      <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
          <h1 class="text-center">Login</h1>
          <h1>예지룽 사랑해용❤❤❤❤</h1>
      </div>
      <div class="modal-body">
          <form class="form col-md-12 center-block">
            <div class="form-group">
              <input type="text" class="form-control input-lg" placeholder="Email">
            </div>
            <div class="form-group">
              <input type="password" class="form-control input-lg" placeholder="Password">
            </div>
            <div class="form-group">
              <button class="btn btn-primary btn-lg btn-block">Sign In</button>
              <span class="pull-right"><a href="#">Register</a></span><span><a href="#">Need help?</a></span>
            </div>
          </form>
      </div>
      <div class="modal-footer">
          <div class="col-md-1accordion2">
          <button class="btn" data-dismiss="modal" aria-hidden="true">Cancel</button>
    	  </div>	
      </div>
  </div>
  </div>
</div>
  </body>
</html>
