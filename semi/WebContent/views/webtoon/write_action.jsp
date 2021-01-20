<%@page import="dao.webtoon.WebtoonDAO"%>
<%@page import="dao.webtoon.WebtoonDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	//변수 선언
	String webtoon_title 	 = "";
	String webtoon_summary	 = "";
	String webtoon_content	 = "";
	String webtoon_author	 = "";
	String thum				 = "";
	String use_yn 			 = "";
	String in_admin			 = "";

	if(request.getParameter("webtoon_title") != null) 	webtoon_title = request.getParameter("webtoon_title"); 
	if(request.getParameter("webtoon_summary") != null) webtoon_summary = request.getParameter("webtoon_summary");
	if(request.getParameter("webtoon_content") != null) webtoon_content = request.getParameter("webtoon_content");
	if(request.getParameter("webtoon_author") != null)  webtoon_author = request.getParameter("webtoon_author");
	if(request.getParameter("addthum") != null) 		thum = request.getParameter("addthum");
	if(request.getParameter("use_yn") != null) 			use_yn = request.getParameter("use_yn");
	
	in_admin = (String) request.getSession().getAttribute("LOGIN_ID");
	
// 	out.println("webtoon_title : " + webtoon_title);
// 	out.println("<br/>");
// 	out.println("webtoon_content : " + webtoon_content);
// 	out.println("<br/>");
// 	out.println("webtoon_summary : " + webtoon_summary);
// 	out.println("<br/>");
// 	out.println("addthum : " + request.getParameter("addthum"));
// 	out.println("<br/>");
// 	out.println("use_yn : " + request.getParameter("use_yn"));
// 	out.println("<br/>");
	
	//DTO
	WebtoonDTO webtoonDTO = new WebtoonDTO();
	
	webtoonDTO.setWebtoon_title(webtoon_title);
	webtoonDTO.setWebtoon_content(webtoon_content);
	webtoonDTO.setWebtoon_summary(webtoon_summary);
	webtoonDTO.setWebtoon_author(webtoon_author);
	webtoonDTO.setThum(thum);
	webtoonDTO.setIn_admin(in_admin);
	
	//DAO
	WebtoonDAO webtoonDAO = new WebtoonDAO();
	
	int result = webtoonDAO.setWebtoon(webtoonDTO);
	
	out.println("result : " + result);
%>





















