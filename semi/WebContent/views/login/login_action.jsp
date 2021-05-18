<%@page import="com.fasterxml.jackson.databind.deser.Deserializers.Base"%>
<%@page import="java.util.*"%>
<%@page import="dao.member.MemberDTO"%>
<%@page import="dao.common.CommonDAO"%>
<%@page import="dao.common.BaseDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="org.json.simple.JSONObject"%>
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
	String msg = "";
	String type = "";
	String isOk = "";
	String member_id = request.getParameter("id");
	String member_pw = request.getParameter("password");
	
	//DAO
	CommonDAO commonDAO = new CommonDAO();
	BaseDAO baseDAO = new BaseDAO();

	//DTO
	HashMap<String, Object> memberMap = new HashMap<String, Object>();
	
	//param check
	if(member_id == null || member_pw == null){
		msg = "데이터 오류";
		isOk = "N";
		
		setReturn(isOk, msg, response);
	}else{
		//PW 암호화 
		member_pw = commonDAO.encryptSHA256(member_pw);
		
		memberMap.put("member_id", member_id);
		memberMap.put("member_pw", member_pw);
		
		String member_type = "";
		member_type = (String) baseDAO.selectOne("Member.getMemberType", member_id);
		
		if(member_type.equals("")){
			type = "TYPE_ERROR";
			isOk = "N";
			response.sendRedirect("login.jsp?type=" + type + "&isOk=" + isOk);
		}
		
		int chkID = (int) baseDAO.selectOne("Member.chkMember", memberMap);
		
		
		if(chkID == 0){
			type = "ID_ERROR";
			isOk = "N";
			response.sendRedirect("login.jsp?type=" + type + "&isOk=" + isOk);
		}else{
			int chkPW = (int) baseDAO.selectOne("chkPW", memberMap); 
			
			if(chkPW == 0){
				type = "PW_ERROR";
				isOk = "N";
				response.sendRedirect("login.jsp?type=" + type + "&isOk=" + isOk);
				
			}else{
				isOk = "Y";
				request.getSession().setAttribute("LOGIN_ID", memberMap.get("member_id"));
				request.getSession().setAttribute("LOGIN_STATUS", "Y");
				request.getSession().setAttribute("LOGIN_TYPE", member_type);
				response.sendRedirect("/views/webtoon/webtoon.jsp?isOk=" + isOk);
				
			}
		}
	}
	
	
	

%>