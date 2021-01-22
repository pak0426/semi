<%@page import="dao.webtoon.WebtoonDAO"%>
<%@page import="dao.webtoon.WebtoonDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");	

	//변수 선언
	String act  = "";
	String isOk = "";
	String type = "";
	
	String webtoon_idx 	 = "";
	String webtoon_title 	 = "";
	String webtoon_summary	 = "";
	String webtoon_content	 = "";
	String webtoon_author	 = "";
	String thum				 = "";
	String use_yn 			 = "";
	String in_admin			 = "";
	String up_admin			 = "";

	//act info
	if(request.getParameter("act") != null) 			act = request.getParameter("act"); 
	
	//webtoon info
	if(request.getParameter("webtoon_idx") != null) 	webtoon_idx = request.getParameter("webtoon_idx"); 
	if(request.getParameter("webtoon_title") != null) 	webtoon_title = request.getParameter("webtoon_title"); 
	if(request.getParameter("webtoon_summary") != null) webtoon_summary = request.getParameter("webtoon_summary");
	if(request.getParameter("webtoon_content") != null) webtoon_content = request.getParameter("webtoon_content");
	if(request.getParameter("webtoon_author") != null)  webtoon_author = request.getParameter("webtoon_author");
	if(request.getParameter("addthum") != null) 		thum = request.getParameter("addthum");
	if(request.getParameter("use_yn") != null) 			use_yn = request.getParameter("use_yn");
	
	out.println("use_yn" + use_yn);
	
	//DTO
	WebtoonDTO webtoonDTO = new WebtoonDTO();
	
	//DTO SET
	webtoonDTO.setWebtoon_idx(webtoon_idx);
	webtoonDTO.setWebtoon_title(webtoon_title);
	webtoonDTO.setWebtoon_content(webtoon_content);
	webtoonDTO.setWebtoon_summary(webtoon_summary);
	webtoonDTO.setWebtoon_author(webtoon_author);
	webtoonDTO.setUse_yn(use_yn);
	webtoonDTO.setThum(thum);
	
	//DAO
	WebtoonDAO webtoonDAO = new WebtoonDAO();	
	
	//INSERT 후 REDIRECT할 webtoon_idx
	int max_idx = webtoonDAO.getMaxIdx();
	
	//등록시
	if(act.equals("I")){
		in_admin = (String) request.getSession().getAttribute("LOGIN_ID");
		webtoonDTO.setIn_admin(in_admin);		
		
		int result = webtoonDAO.setWebtoon(webtoonDTO);
		
		//등록이 되었을때
		if(result == 1){
			isOk = "Y";
			type = "SET_SUCC";
			response.sendRedirect("./write.jsp?webtoon_idx=" + max_idx + "&isOk=" + isOk + "&type=" + type);
		}else{
			//등록 실패시
			isOk = "N";
			type = "SET_FAIL";
			response.sendRedirect("./write.jsp?isOk=" + isOk + "&type=" + type);
		}
	//수정시
	}else{
		up_admin = (String) request.getSession().getAttribute("LOGIN_ID");
		webtoonDTO.setUp_admin(up_admin);
		
		int result = webtoonDAO.modWebtoon(webtoonDTO);
		
		//수정 성공
		if(result == 1){
			isOk = "Y";
			type = "MOD_SUCC";
			response.sendRedirect("./write.jsp?webtoon_idx=" + webtoon_idx + "&isOk=" + isOk + "&type=" + type);
		}else{
			//수정 실패
			isOk = "N";
			type = "MOD_FAIL";
			response.sendRedirect("./write.jsp?webtoon_idx=" + webtoon_idx + "&isOk=" + isOk + "&type=" + type);
		}
		
	}
	
%>





















