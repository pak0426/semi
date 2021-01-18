<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	//변수 선언
	String board_title 	 = "";
	String board_summary = "";
	String board_content = "";
	String addthum		 = "";
	String use_yn 		 = "";

	if(request.getParameter("board_title") != null) board_title = request.getParameter("board_title"); 
	if(request.getParameter("board_summary") != null) board_summary = request.getParameter("board_summary");
	if(request.getParameter("board_content") != null) board_content = request.getParameter("board_content");
	if(request.getParameter("addthum") != null) addthum = request.getParameter("addthum");
	if(request.getParameter("use_yn") != null) use_yn = request.getParameter("use_yn");
	
	out.println("board_title : " + board_title);
	out.println("<br/>");
	out.println("board_content : " + board_content);
	out.println("<br/>");
	out.println("board_summary : " + board_summary);
	out.println("<br/>");
	out.println("addthum : " + request.getParameter("addthum"));
	out.println("<br/>");
%>