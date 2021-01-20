<%@page import="dao.common.CommonDAO"%>
<%@page import="dao.member.MemberDTO"%>
<%@page import="dao.member.MemberDAO"%>
<%@page import="org.json.simple.JSONObject"%>
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
	String type = "";
	String isOk = "";
	String msg 	= "";
	
	//parameter
	String member_name = request.getParameter("name");
	String member_id = request.getParameter("id");
	String member_email = request.getParameter("email");
	String member_pw  = request.getParameter("password");
	
	//DTO
	MemberDTO memberDTO = new MemberDTO();
	
	memberDTO.setMember_type("회원");
	memberDTO.setMember_name(member_name);
	memberDTO.setMember_id(member_id);
	memberDTO.setMember_email(member_email);
	
	//비밀번호 암호화
	CommonDAO commonDAO = new CommonDAO();
	member_pw = commonDAO.encryptSHA256(member_pw);
	
	memberDTO.setMember_pw(member_pw);
	
	//DAO
	MemberDAO memberDAO = new MemberDAO();
	
	int result = 0;	
	int chkMember = memberDAO.chkMember(memberDTO);
	
	//등록 후 Process
	if(chkMember > 0){
		//ID 중복시
		type = "A";
		isOk = "N";
		msg  = "ID가 중복되었습니다.";
// 		response.sendRedirect("register.jsp?type=" + type + "&isOk=" + isOk);
		setReturn(isOk, msg, response);
	}else{
		//등록 성공시
		memberDAO.setMember(memberDTO);
		isOk = "Y";
		msg = "등록에 성공하였습니다.";
		setReturn(isOk, msg, response);
// 		response.sendRedirect("login.jsp?isOk=" + isOk);
	}
	
	
	
	
%>
