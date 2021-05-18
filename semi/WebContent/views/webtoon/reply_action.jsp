<%@page import="dao.common.BaseDAO"%>
<%@page import="dao.reply.ReplyDAO"%>
<%@page import="dao.reply.ReplyDTO"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public void returnJson(String isOk, String msg, HttpServletResponse response){
		JSONObject jsonObj = new JSONObject();
		jsonObj.put("isOk", isOk);
		jsonObj.put("msg", msg);
		
		try{
			PrintWriter out = response.getWriter();
			out.print(jsonObj.toJSONString());
			response.setContentType("application/json");
		}catch(Exception e){
			e.printStackTrace();
		}
	}
%>
<%
	request.setCharacterEncoding("UTF-8");	
	
	ReplyDTO replyDTO = null;
	BaseDAO baseDAO = null;
	
	String reply_act = "";
	
	String reply_idx = "";
	String pa_idx = "";
	String reply_content = "";
	String in_admin = "";
	String in_date = "";
	String up_admin = "";
	String up_date = "";
	
	String hidden_reply_content = "";
	
	String agree_type = "";
	
	String isOk = "";
	String msg = "";
	
	if(request.getParameter("reply_act") != null) 		reply_act = request.getParameter("reply_act");
	if(request.getParameter("reply_idx") != null) 		reply_idx = request.getParameter("reply_idx");
	if(request.getParameter("pa_idx") != null) 			pa_idx = request.getParameter("pa_idx");
	if(request.getParameter("reply_content") != null) 	reply_content = request.getParameter("reply_content");
	if(request.getParameter("in_admin") != null)		in_admin = request.getParameter("in_admin");
	if(request.getParameter("in_date") != null) 		in_date = request.getParameter("in_date");
	if(request.getParameter("up_admin") != null)		up_admin = request.getParameter("up_admin");
	if(request.getParameter("up_date") != null) 		up_date = request.getParameter("up_date");
	
	if(request.getParameter("hidden_reply_content") != null) 	hidden_reply_content = request.getParameter("hidden_reply_content");
	
	if(request.getParameter("agree_type") != null) 	agree_type = request.getParameter("agree_type");
	
	System.out.println("reply_act : " + reply_act);
	System.out.println("reply_idx : " + reply_idx);
	System.out.println("pa_idx : " + pa_idx);
	System.out.println("content : " + reply_content);
	System.out.println("hidden_reply_content : " + hidden_reply_content);
	System.out.println("in_admin : " + in_admin);
	System.out.println("agree_type : " + agree_type);
	
	if(reply_act.equals("")){
		isOk = "N";
		msg = "act값이 누락되었습니다.";
	 	returnJson(isOk, msg, response);
	 	return;
	}
	
	if(reply_act.equals("I")){
		baseDAO = new BaseDAO();
		replyDTO = new ReplyDTO();
		
		if(pa_idx.equals("") || reply_content.equals("") || in_admin.equals("")){
			isOk = "N";
			msg = "필수 값이 누락되었습니다.";
		 	returnJson(isOk, msg, response);
		 	return;
		}
		
		int nextval = 0;
		nextval = (int) baseDAO.selectOne("Reply.replyNextVal", null);
		
// 		replyDTO.setReply_idx(nextval);
// 		replyDTO.setPa_idx(Integer.parseInt(pa_idx));
// 		replyDTO.setReply_content(reply_content);
// 		replyDTO.setIn_admin(in_admin);

		Map<String, Object> setParam = new HashMap<String, Object>();
		setParam.put("nextval", nextval);
		setParam.put("pa_idx", pa_idx);
		setParam.put("reply_content", reply_content);
		setParam.put("in_admin", in_admin);
		
		int result = 0;
		result = (int) baseDAO.insert("Reply.setReply", setParam);
		
		if(result == 1){
			isOk = "Y";
			msg = "댓글 등록에 성공하였습니다.";
		 	returnJson(isOk, msg, response);
		 	return;
		}else{
			isOk = "N";
			msg = "댓글 등록에 실패하였습니다.";
		 	returnJson(isOk, msg, response);
		 	return;
		}
	}
	else if(reply_act.equals("U")){
		baseDAO = new BaseDAO();
		
		if(reply_idx.equals("") || hidden_reply_content.equals("") || in_admin.equals("")){
			isOk = "N";
			msg = "필수 값이 누락되었습니다.";
		 	returnJson(isOk, msg, response);
		 	return;
		}
		
		hidden_reply_content = hidden_reply_content.replaceAll("&nbsp", " ");
		
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("reply_idx", reply_idx);
		param.put("reply_content", hidden_reply_content);
		param.put("up_admin", in_admin);
		
		int result = 0;
		result = (int) baseDAO.update("Reply.modReply", param);
		
		if(result == 1){
			isOk = "Y";
			msg = "댓글 수정에 성공하였습니다.";
		 	returnJson(isOk, msg, response);
		 	return;
		}else{
			isOk = "N";
			msg = "댓글 수정에 실패하였습니다.";
		 	returnJson(isOk, msg, response);
		 	return;
		}
	}
	else if(reply_act.equals("D")){
		baseDAO = new BaseDAO();
		
		if(reply_idx.equals("")){
			isOk = "N";
			msg = "필수 값이 누락되었습니다.";
		 	returnJson(isOk, msg, response);
		 	return;
		}
		
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("reply_idx", reply_idx);
		
		int result = 0;
		result = (int) baseDAO.delete("Reply.delReply", param);
		
		if(result == 1){
			isOk = "Y";
			msg = "댓글 삭제에 성공하였습니다.";
		 	returnJson(isOk, msg, response);
		 	return;
		}else{
			isOk = "N";
			msg = "댓글 삭제에 실패하였습니다.";
		 	returnJson(isOk, msg, response);
		 	return;
		}
	}
	if(reply_act.equals("A")){
		baseDAO = new BaseDAO();
		
		if(reply_idx.equals("") || in_admin.equals("") || agree_type.equals("")){
			isOk = "N";
			msg = "필수 값이 누락되었습니다.";
		 	returnJson(isOk, msg, response);
		 	return;
		}
		
		int nextval = 0;
		nextval = (int) baseDAO.selectOne("Reply.agreeNextVal", null);

		Map<String, Object> setParam = new HashMap<String, Object>();
		setParam.put("nextval", nextval);
		setParam.put("reply_idx", reply_idx);
		setParam.put("in_admin", in_admin);
		setParam.put("type", agree_type);
		
		int result = 0;
		result = (int) baseDAO.insert("Reply.setAgree", setParam);
		
		if(result == 1){
			isOk = "Y";
			if(agree_type.equals("Y")){
				msg = "좋아요에 성공하였습니다.";
			}else{
				msg = "싫어요에 성공하였습니다.";
			}
		 	returnJson(isOk, msg, response);
		 	return;
		}else{
			isOk = "N";
			if(agree_type.equals("Y")){
				msg = "좋아요에 성공하였습니다.";
			}else{
				msg = "싫어요에 성공하였습니다.";
			}
		 	returnJson(isOk, msg, response);
		 	return;
		}
	}
%>
