<%@page import="dao.member.MemberDTO"%>
<%@page import="dao.member.MemberDAO"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public void setReturn(String isOk, String msg, HttpServletResponse response) {
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("msg", msg);
		jsonObject.put("isOk", isOk);
		
		try{
			response.getWriter().write(jsonObject.toString());		
		}catch(Exception e){
			System.out.println(e.getMessage());
		}	
	}
%>
<% 
	//response
	String msg = "";
	String isOk = "";
	
	//parameter
	String member_name = request.getParameter("name");
	String member_id = request.getParameter("id");
	String member_email = request.getParameter("email");
	String member_pw  = request.getParameter("password");
	
	//DTO
	MemberDTO memberDTO = new MemberDTO();
	
	memberDTO.setMember_name(member_name);
	memberDTO.setMember_id(member_id);
	memberDTO.setMember_email(member_email);
	memberDTO.setMember_pw(member_pw);
	
	//HashMap
	
	//DAO
	MemberDAO memberDAO = new MemberDAO();
	int result = memberDAO.setMember(memberDTO);
	
	out.println("result : " + result);
	
	
	
	
%>
