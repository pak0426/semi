<%@page import="dao.common.BaseDAO"%>
<%@page import="dao.common.FileDAO"%>
<%@page import="dao.common.CommonDAO"%>
<%@page import="java.io.File"%>
<%@page import="java.util.*"%>
<%@page import="dao.webtoon.WebtoonDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String getIp(HttpServletRequest request) {
	    String ip = request.getHeader("X-Forwarded-For");
	    if (ip != null && ip.indexOf(",") > -1)  ip = ip.substring(0, ip.indexOf(","));
	    if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) ip = request.getHeader("Proxy-Client-IP"); 
	    if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) ip = request.getHeader("WL-Proxy-Client-IP"); 
	    if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) ip = request.getHeader("HTTP_CLIENT_IP"); 
	    if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) ip = request.getHeader("HTTP_X_FORWARDED_FOR"); 
	    if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) ip = request.getRemoteAddr(); 
	    return ip;
	}
%>
<%
	request.setCharacterEncoding("UTF-8");	
	
	//파일 업로드를 위한 변수 선언
	
	String file_name = "";
	String ori_name = "";
	String file_type = "";
	long file_size = 0;
	
	// 파일 저장 경로
	// String savePath = "D:/Projects/workspace/projectName/WebContent/upload";
	String savePath = request.getRealPath("upload");
	out.println("파일 경로 : " + savePath);
	
	//15MB로 제한
	int sizeLimit = 1024*1024*15;
	
	//변수 선언
	String isOk = "";
	String type = "";
	String act  = "";
	
	String webtoon_idx 	 	 = "";
	String webtoon_title 	 = "";
	String webtoon_summary	 = "";
	String webtoon_content	 = "";
	String webtoon_author	 = "";
	String thum				 = "";
	String use_yn 			 = "";
	String in_admin			 = "";
	String up_admin			 = "";
	
	String sv_name = "";
	
	//DAO
	BaseDAO baseDAO = new BaseDAO();
	
// 	CommonDAO commonDAO = new CommonDAO();
	
	if(request.getParameter("act") != null) act = request.getParameter("act");
	
	if(act.equals("")) {
		 isOk = "N";
		 type = "VAL_FAIL";
		 response.sendRedirect("./write.jsp?isOk=" + isOk + "&type=" + type);			 
		 return;
	}
	
	//등록시***********************************************************************************************************************************************
	if(act.equals("I")){
		//webtoon info
		if(request.getParameter("webtoon_idx") != null) 		webtoon_idx = request.getParameter("webtoon_idx"); 
		if(request.getParameter("webtoon_title") != null) 	webtoon_title = request.getParameter("webtoon_title"); 
		if(request.getParameter("webtoon_summary") != null) 	webtoon_summary = request.getParameter("webtoon_summary");
		if(request.getParameter("webtoon_content") != null) 	webtoon_content = request.getParameter("webtoon_content");
		if(request.getParameter("webtoon_author") != null) 	webtoon_author = request.getParameter("webtoon_author");
		if(request.getParameter("use_yn") != null) 			use_yn = request.getParameter("use_yn");
		//MULTI END
		
		 //VAL CHECK
		 if(webtoon_title.equals("")
		 || webtoon_content.equals("")
		 || webtoon_author.equals(""))
		 {
			 isOk = "N";
			 type = "VAL_FAIL";
			 response.sendRedirect("./write.jsp?isOk=" + isOk + "&type=" + type);			 
			 return;
		 }
			 
		
		//INSERT 후 REDIRECT할 webtoon_idx
		int nextVal = (int) baseDAO.selectOne("Webtoon.getNextVal", null);
		
		//MAP
		Map<String, Object> webtoonMap = new HashMap<String, Object>();
		Map<String, Object> fileMap = new HashMap<String, Object>();
		
		in_admin = (String) request.getSession().getAttribute("LOGIN_ID");
		
		out.println("<br/>");
		out.println("nextVal : " + nextVal);
		
		webtoonMap.put("nextVal", nextVal);
		webtoonMap.put("webtoon_title", webtoon_title);
		webtoonMap.put("webtoon_content", webtoon_content);
		webtoonMap.put("webtoon_summary", webtoon_summary);
		webtoonMap.put("webtoon_author", webtoon_author);
		webtoonMap.put("use_yn", use_yn);
		webtoonMap.put("thum", thum);
		webtoonMap.put("in_admin", in_admin);
		
		//등록
		int result = (int) baseDAO.insert("Webtoon.setWebtoon", webtoonMap);
		
		out.println("<br/>");
		out.println("result : " + result);
		
				
		out.println("<br/>");
		 
		//등록이 되었을때
		if(result == 1){
			isOk = "Y";
			type = "SET_SUCC";
			response.sendRedirect("./write.jsp?webtoon_idx=" + nextVal + "&isOk=" + isOk + "&type=" + type);
		}else{
			//등록 실패시
			isOk = "N";
			type = "SET_FAIL";
			response.sendRedirect("./write.jsp?isOk=" + isOk + "&type=" + type);
		}
 	}
	//수정시	***********************************************************************************************************************************************
	else if(act.equals("U")){
		//webtoon info
		if(request.getParameter("webtoon_idx") != null) 		webtoon_idx = request.getParameter("webtoon_idx");
		if(request.getParameter("webtoon_title") != null) 	webtoon_title = request.getParameter("webtoon_title"); 
		if(request.getParameter("webtoon_summary") != null) 	webtoon_summary = request.getParameter("webtoon_summary");
		if(request.getParameter("webtoon_content") != null) 	webtoon_content = request.getParameter("webtoon_content");
		if(request.getParameter("webtoon_author") != null) 	webtoon_author = request.getParameter("webtoon_author");
		if(request.getParameter("thum") != null) 				thum = request.getParameter("thum");
		if(request.getParameter("use_yn") != null) 			use_yn = request.getParameter("use_yn");
		
		//VAL CHECK
		 if(webtoon_title.equals("")
		 || webtoon_content.equals("")
		 || webtoon_author.equals(""))
		 {
			 isOk = "N";
			 type = "VAL_FAIL";
			 response.sendRedirect("./write.jsp?isOk=" + isOk + "&type=" + type);			 
			 return;
		 }
		
		//Map SET
		Map<String, Object> webtoonMap = new HashMap<String, Object>();
		Map<String, Object> fileMap = new HashMap<String, Object>();
		webtoonMap.put("webtoon_idx", webtoon_idx);
		webtoonMap.put("webtoon_title", webtoon_title);
		webtoonMap.put("webtoon_content", webtoon_content);
		webtoonMap.put("webtoon_summary", webtoon_summary);
		webtoonMap.put("webtoon_author", webtoon_author);
		webtoonMap.put("use_yn", use_yn);
		
		in_admin = (String) request.getSession().getAttribute("LOGIN_ID");
		webtoonMap.put("up_admin", in_admin);
		
		int result = (int) baseDAO.update("Webtoon.modWebtoon", webtoonMap);
		
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
	//삭제시	***********************************************************************************************************************************************
	else if(act.equals("D")){
		if(request.getParameter("webtoon_idx") != null) webtoon_idx = request.getParameter("webtoon_idx"); 
		if(request.getParameter("sv_name") != null) sv_name = request.getParameter("sv_name"); 
		
		if(webtoon_idx.equals("")){
			//수정 실패
			isOk = "N";
			type = "VAL_FAIL";
			response.sendRedirect("./webtoon.jsp?isOk=" + isOk + "&type=" + type);
			return;
		}
		
		
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("pa_idx", webtoon_idx);
		param.put("sv_name", sv_name);
		
		int result = (int) baseDAO.delete("Webtoon.delWebtoon", webtoon_idx);
		
		int file_result = 0;
		if(!sv_name.equals("")) file_result = (int) baseDAO.delete("File.delFile", param);
		
		
		out.println("<br/>");
		out.println("result :  " + result);
		out.println("<br/>");
		out.println("del result :  " + file_result);
		out.println("<br/>");
		out.println("del webtoon_idx :  " + webtoon_idx);
		out.println("<br/>");
		out.println("del sv_name :  " + sv_name);
		
		//삭제 성공
		if(result == 1){
			isOk = "Y";
			type = "DEL_SUCC";
			response.sendRedirect("./webtoon.jsp?isOk=" + isOk + "&type=" + type);
		}else{
			//수정 실패
			isOk = "N";
			type = "DEL_FAIL";
			response.sendRedirect("./webtoon.jsp?isOk=" + isOk + "&type=" + type);
		}
	} 
	else if(act.equals("delThum")){
		int result = 0;
		int result_file = 0;
		if(request.getParameter("webtoon_idx") != null) webtoon_idx = request.getParameter("webtoon_idx");
		if(request.getParameter("sv_name") != null) sv_name = request.getParameter("sv_name");
		
		
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("pa_idx", webtoon_idx);
		param.put("sv_name", sv_name);
		
		
		if(!webtoon_idx.equals("") && !(sv_name.equals(""))){
			result_file = (int) baseDAO.delete("File.delFile", param);
		}
		//삭제 성공
		if(result == 1){
			
		}
	}
%>