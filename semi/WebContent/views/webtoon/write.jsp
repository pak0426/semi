<%@page import="java.util.*"%>
<%@page import="dao.reply.ReplyDAO"%>
<%@page import="dao.webtoon.WebtoonDAO"%>
<%@page import="dao.webtoon.WebtoonDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/views/inc/common.jsp"%>
<%
	String session_login_id = (String) request.getSession().getAttribute("LOGIN_ID");	
	String session_login_status = (String) request.getSession().getAttribute("LOGIN_STATUS");
	String session_login_type = (String) request.getSession().getAttribute("LOGIN_TYPE");
	
	//변수 선언
	String act = "I";
	
	String webtoon_idx		 = "";
	String webtoon_title	 = "";
	String webtoon_summary	 = "";
	String webtoon_content	 = "";
	String webtoon_author	 = "";
	String in_admin			 = "";
	String thum				 = "";
	String use_yn 			 = "";
	String use_yn_str		 = "";
	String sv_name			 = "";
	
	
	
	//null 처리
	if(request.getParameter("webtoon_idx") != null) 	webtoon_idx = request.getParameter("webtoon_idx"); 
	
	//DAO
	WebtoonDAO webtoonDAO = new WebtoonDAO();
	if(!webtoon_idx.equals("")){
		act = "U";
		
		//DTO
		WebtoonDTO webtoonDTO = new WebtoonDTO();
		
		//DAO
		webtoonDTO = webtoonDAO.getWebtoon(webtoon_idx);
		
		if(webtoonDTO != null){
			if(webtoonDTO.getWebtoon_title() != null) 	webtoon_title 	 = webtoonDTO.getWebtoon_title();
			if(webtoonDTO.getWebtoon_summary() != null) webtoon_summary	 = webtoonDTO.getWebtoon_summary();
			if(webtoonDTO.getWebtoon_content() != null) webtoon_content	 = webtoonDTO.getWebtoon_content();
			if(webtoonDTO.getWebtoon_author() != null) 	webtoon_author	 = webtoonDTO.getWebtoon_author();
			if(webtoonDTO.getIn_admin() != null) 		in_admin	 	 = webtoonDTO.getIn_admin();
			if(webtoonDTO.getThum() != null) 			thum			 = webtoonDTO.getThum();
			if(webtoonDTO.getUse_yn() != null) 			use_yn 			 = webtoonDTO.getUse_yn();
			if(webtoonDTO.getSv_name() != null) 		sv_name			 = webtoonDTO.getSv_name();
		}
	}
	
	boolean isWriter = false;
	System.out.println("=============in_admin : " + in_admin);
	System.out.println("=============session_login_id : " + session_login_id);
	if(in_admin.equals(session_login_id)){
		isWriter = true;
	}
	
	//isOk, msg
	String isOk = "";
	String type  = "";
	
	if(request.getParameter("isOk") != null)  isOk = request.getParameter("isOk"); 
	if(request.getParameter("type") != null)  type = request.getParameter("type");
	
	//====================REPLY
	ReplyDAO replyDAO = new ReplyDAO();
	HashMap<String, Object> listParam = new HashMap<String, Object>();
	listParam.put("pa_idx", webtoon_idx);		
	
	List<HashMap<String, Object>> list = replyDAO.getReplyList(listParam);			
%>
<!DOCTYPE html>
<html>
<link href="http://netdna.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet">
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
<link type="text/css" rel="stylesheet" href="/res/css/base.css">
<link type="text/css" rel="stylesheet" href="/res/css/write.css">
<head>
<script type="text/javascript" src="/res/js_dev/reply.js"></script>
<script type="text/javascript">
	let webtoon_idx = "<%=webtoon_idx %>";
	let isOk = "<%=isOk %>"; 
	let type = "<%=type %>";
	let isWriter = "<%=isWriter%>";
	let login_type = "<%=session_login_type %>"
	
	$(document).ready(function(){
		if(isWriter == "false" && login_type != "admin" && webtoon_idx != ""){
			ChkWriter();
		}
		
		if(isOk == "Y"){
			if(type == "SET_SUCC"){
				alert("등록에 성공하였습니다.");
				webtoon_idx = getParameter("webtoon_idx");
				location.href = "./write.jsp?webtoon_idx=" + webtoon_idx;
			}else if(type == "MOD_SUCC"){				
				alert("수정에 성공하였습니다.");
				webtoon_idx = getParameter("webtoon_idx");
				location.href = "./write.jsp?webtoon_idx=" + webtoon_idx;
			}
		}else{
			if(type == "SET_FAIL"){
				alert("등록에 실패하였습니다.");				
				location.href = "./write.jsp";
				
			}else if(type == "MOD_FAIL"){
				alert("수정에 실패하였습니다.");
				location.href = "./write.jsp?webtoon_idx=" + webtoon_idx;
			}else if(type == "VAL_FAIL"){
				alert("필수값이 누락되었습니다.");
				location.href = "./write.jsp?webtoon_idx=" + webtoon_idx;
			}	
		}
	});

	function setForm(){
		if($("#webtoon_title").val() == ""){
			alert("제목을 입력해주세요.");
			$("#webtoon_title").focus();
			return false;
		}
		if($("#webtoon_content").val() == ""){
			alert("내용을 입력해주세요.");
			$("#webtoon_content").focus();
			return false;
		}
		if($("#webtoon_author").val() == ""){
			alert("작성자를 입력해주세요.");
			$("#webtoon_content").focus();
			return false;
		}
			
		$("#writeForm").submit();
	}
	
	function getParameter(name){
		name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
		var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
        results = regex.exec(location.search);
    	return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
	}
	
	function delThum(){
		let data_ = {
			 webtoon_idx : "<%=webtoon_idx %>"
			,act : "delThum"
			,sv_name : "<%=sv_name %>"
		}
		
		$.ajax({
			type : "POST"
			,url : "./write_action.jsp"
			,data : data_			
			,success : function(result){
				var data = result.jsonObj;
				console.log(data);
				alert("삭제되었습니다.");
				$("#div_thum").hide();
			}
			,error : function(request, status, error){
				console.log("code : " + request.status + "\n" + "message :" + request.responseText + "\n" + "error : " + error);
				alert("오류가 발생했습니다. \n다시 시도해주세요.");
				return false;
			}
		});
	}
	
	function ChkWriter(){
		$("#webtoon_title").attr("readonly","true")
		$("#webtoon_summary").attr("readonly","true")
		$("#webtoon_content").attr("readonly","true")
		$("#webtoon_author").attr("readonly","true")
		$("#div_thum_sel").hide();
		$("#div_use").hide();
		$("#set_btn").hide();
		$("#del_btn").hide();
		$("#del_thum_btn").hide();
	}
</script>
<meta charset="UTF-8">
<title>Write</title>
</head>
<body>
	<div class="container bootstrap snippets bootdey m-auto">
		<%@ include file="../inc/top.jsp"%>
		<div class="row justify-content-center">
			<div class="col-lg-12">
				<h2 class="h3 mb-4 page-title">write</h2>
				<div class="my-4">
					<form enctype="multipart/form-data" class="form-horizontal" id="writeForm" name="writeForm" action="./write_action.jsp?act=<%=act %>" method="post">
						<input type="hidden" id="webtoon_idx" name="webtoon_idx" value="<%=webtoon_idx %>" />
						<input type="hidden" id="session_login_id" name="session_login_id" value="<%=session_login_id %>" />
						<hr class="my-4" />
						<div class="form-group">
							<label for="webtoon_title">제목</label> <input type="text" class="form-control" id="webtoon_title" name="webtoon_title" style="height: 40px" value="<%=webtoon_title %>" />
						</div>
						<div class="form-group">
							<label for="firstname">요약</label>
							<textarea class="form-control" id="webtoon_summary" name="webtoon_summary" style="height: 200px"><%=webtoon_summary %></textarea>
						</div>
						<div class="form-group">
							<label for="firstname">내용</label>
							<textarea class="form-control" id="webtoon_content" name="webtoon_content" style="height: 200px"><%=webtoon_content %></textarea>
						</div>
						<div class="form-group">
							<label for="firstname">작성자</label> <input type="text" class="form-control" id="webtoon_author" name="webtoon_author" style="height: 40px" value="<%=webtoon_author%>" />
						</div>
						<div class="form-group">
							<label for="firstname">썸네일 이미지</label><br />
<%
	if(!thum.equals("")){
%>
							<div id="div_thum">
								<img src="/upload/<%=thum %>" width=600px> <label class="d-block mt-2" for="secondname">현재 썸네일 : <%=thum %></label>
								<button type="button" id="del_thum_btn" class="btn btn-sm btn-danger" onclick="delThum();">삭제하기</button>
								<br />
								<br />
							</div>
<%
	}
%>

							<div id="div_thum_sel">
								<div class="spinner-border text-primary" role="status">
									<span class="visually-hidden">* 이미지 권장 사이즈 : 600 * 400</span>
								</div>
								<br /> <input class="form-control" type="file" id="thum" name="thum">
							</div>
						</div>
						<div class="form-group" id="div_use">
<%	
		if(webtoon_idx.equals("")){
%>
							<label for="firstname">사용 여부</label> <label><input type="radio" id="use_y" name="use_yn" value="Y" checked />&nbsp;사용</label>&nbsp;&nbsp;&nbsp; <label><input type="radio" id="use_n" name="use_yn" value="N" />&nbsp;미사용</label>
<%
		}else{
%>
							<label><input type="radio" id="use_y" name="use_yn" value="Y" <%=use_yn.equals("Y") ? "checked" : "" %> />&nbsp;사용</label>&nbsp;&nbsp;&nbsp; <label><input type="radio" id="use_n" name="use_yn" value="N" <%=use_yn.equals("N") ? "checked" : "" %> />&nbsp;미사용</label>
<%
		}
%>

						</div>
					</form>
					<button type="submit" class="btn btn-primary" onclick="location.href = './webtoon.jsp'">목록</button>
					<button type="submit" id="set_btn" class="btn btn-primary float-right" onclick="setForm();" style="margin-left: 20px">저장</button>
					<button type="submit" id="del_btn" class="btn btn-danger float-right" onclick="location.href = './write_action.jsp?webtoon_idx=<%=webtoon_idx %>&act=D&sv_name=<%=sv_name %>'">삭제</button>
				</div>
			</div>
		</div>
	</div>
	<div class="container bootdey m-auto" style="padding: 0px">
		<div class="col-md-12 bootstrap snippets" style="background-color: #FFFFFF;">
			<div class="panel">
				<div class="panel-body">
					<form id="replyForm" name="replyForm" action="./reply_action.jsp">
						<input type="hidden" id="hidden_reply_idx" name="hidden_reply_idx" value="">
						<input type="hidden" id="hidden_reply_content" name="hidden_reply_content" value="">
						<textarea class="form-control" placeholder="댓글을 작성해주세요!" id="reply_content"></textarea>
					</form>
					<div class="mar-top clearfix">
						<button class="btn btn-sm btn-primary pull-right" type="submit" onclick="reply.setReplyForm(this, 'I');">
							<i class="fa fa-pencil fa-fw"></i> Share
						</button>
						<a class="btn btn-trans btn-icon fa fa-video-camera add-tooltip" href="javascript:void(0)"></a> <a class="btn btn-trans btn-icon fa fa-camera add-tooltip" href="javascript:void(0)"></a> <a class="btn btn-trans btn-icon fa fa-file add-tooltip" href="javascript:void(0)"></a>
					</div>
				</div>
			</div>
			<div class="panel">
				<div class="panel-body">
					<!-- Newsfeed Content -->
					<!--===================================================-->
<%
	for(int i=0; i<list.size(); i++){
		String reply_content = list.get(i).get("REPLY_CONTENT").toString();
		reply_content = reply_content.replaceAll("\n", "<br/>");
		reply_content = reply_content.replaceAll(" ", "&nbsp");
%>
				
					<div class="media-block">
						<a class="media-left" href="javascript:void(0)">
<!-- 							<img class="img-circle img-sm" alt="Profile Picture" src="https://bootdey.com/img/Content/avatar/avatar1.png"> -->
						</a>
						<div class="media-body" id="reply_<%=list.get(i).get("REPLY_IDX") %>">
							<div class="mar-btm">
								<a href="javascript:void(0)" class="btn-link text-semibold media-heading box-inline" ><%= list.get(i).get("IN_ADMIN")%></a>
<%
	if(list.get(i).get("IN_ADMIN").equals(session_login_id) || session_login_type.equals("admin")){
%>								
								<div style="float:right;">
									<a class="btn-sm btn-success" id="reply_mod_<%=list.get(i).get("REPLY_IDX") %>" href="javascript:void(0)" onclick="reply.ajaxModReply(this, '<%=session_login_id %>', '<%=list.get(i).get("IN_DATE_STR") %>', '<%=reply_content %>');">수정</a>
									<a class="btn-sm btn-danger" href="javascript:void(0)" onclick="reply.setReplyForm(this, 'D')">삭제</a>
								</div>
<%		
	}
%>								
								
								<p class="text-muted text-sm"><%=list.get(i).get("UP_DATE_STR") != null ? list.get(i).get("UP_DATE_STR") : list.get(i).get("IN_DATE_STR")%></p>
							</div>
							<div>
								<p><%=reply_content %></p>
							</div>
							<div class="pad-ver">
								<div class="btn-group">
									<a class="btn btn-sm btn-default btn-hover-success" href="javascript:void(0)" onclick="reply.setAgree('Y','<%=list.get(i).get("REPLY_IDX") %>', '<%=session_login_id %>');">
										<i class="fa fa-thumbs-o-up" aria-hidden="true"> <%=list.get(i).get("YES") %></i>
									</a>
									<a class="btn btn-sm btn-default btn-hover-danger" href="javascript:void(0)" onclick="reply.setAgree('N','<%=list.get(i).get("REPLY_IDX") %>', '<%=session_login_id %>');">
										<i class="fa fa-thumbs-o-down"> <%=list.get(i).get("NO") %></i>
									</a>
								</div>
								<a class="btn btn-sm btn-default btn-hover-primary" href="javascript:void(0)" >Comment</a>
							</div>
							<hr>

							<!-- Comments -->
							<!--         <div> -->
							<!--           <div class="media-block"> -->
							<!--             <a class="media-left" href="javascript:void(0)"><img class="img-circle img-sm" alt="Profile Picture" src="https://bootdey.com/img/Content/avatar/avatar2.png"></a> -->
							<!--             <div class="media-body"> -->
							<!--               <div class="mar-btm"> -->
							<!--                 <a href="javascript:void(0)" class="btn-link text-semibold media-heading box-inline">Bobby Marz</a> -->
							<!--                 <p class="text-muted text-sm"><i class="fa fa-mobile fa-lg"></i> - From Mobile - 7 min ago</p> -->
							<!--               </div> -->
							<!--               <p>Sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat.</p> -->
							<!--               <div class="pad-ver"> -->
							<!--                 <div class="btn-group"> -->
							<!--                   <a class="btn btn-sm btn-default btn-hover-success active" href="javascript:void(0)"><i class="fa fa-thumbs-up"></i> You Like it</a> -->
							<!--                   <a class="btn btn-sm btn-default btn-hover-danger" href="javascript:void(0)"><i class="fa fa-thumbs-down"></i></a> -->
							<!--                 </div> -->
							<!--                 <a class="btn btn-sm btn-default btn-hover-primary" href="javascript:void(0)">Comment</a> -->
							<!--               </div> -->
							<!--               <hr> -->
							<!--             </div> -->
							<!--           </div> -->
							<!--         </div> -->
						</div>
					</div>
					<br/>
<%		
	}
%>					
					<!--===================================================-->
					<!-- End Newsfeed Content -->


					<!-- Newsfeed Content -->
					<!--===================================================-->
<!-- 					<div class="media-block pad-all"> -->
<!-- 						<a class="media-left" href="javascript:void(0)"><img class="img-circle img-sm" alt="Profile Picture" src="https://bootdey.com/img/Content/avatar/avatar1.png"></a> -->
<!-- 						<div class="media-body"> -->
<!-- 							<div class="mar-btm"> -->
<!-- 								<a href="javascript:void(0)" class="btn-link text-semibold media-heading box-inline">John Doe</a> -->
<!-- 								<p class="text-muted text-sm"> -->
<!-- 									<i class="fa fa-mobile fa-lg"></i> - From Mobile - 11 min ago -->
<!-- 								</p> -->
<!-- 							</div> -->
<!-- 							<p>Lorem ipsum dolor sit amet.</p> -->
<!-- 							<img class="img-responsive thumbnail" src="https://via.placeholder.com/400x300" alt="Image"> -->
<!-- 							<div class="pad-ver"> -->
<!-- 								<span class="tag tag-sm"><i class="fa fa-heart text-danger"></i> 250 Likes</span> -->
<!-- 								<div class="btn-group"> -->
<!-- 									<a class="btn btn-sm btn-default btn-hover-success" href="javascript:void(0)"><i class="fa fa-thumbs-up"></i></a> <a class="btn btn-sm btn-default btn-hover-danger" href="javascript:void(0)"><i class="fa fa-thumbs-down"></i></a> -->
<!-- 								</div> -->
<!-- 								<a class="btn btn-sm btn-default btn-hover-primary" href="javascript:void(0)">Comment</a> -->
<!-- 							</div> -->
<!-- 							<hr> -->

<!-- 							Comments -->
<!-- 							<div> -->
<!-- 								<div class="media-block pad-all"> -->
<!-- 									<a class="media-left" href="javascript:void(0)"><img class="img-circle img-sm" alt="Profile Picture" src="https://bootdey.com/img/Content/avatar/avatar2.png"></a> -->
<!-- 									<div class="media-body"> -->
<!-- 										<div class="mar-btm"> -->
<!-- 											<a href="javascript:void(0)" class="btn-link text-semibold media-heading box-inline">Maria Leanz</a> -->
<!-- 											<p class="text-muted text-sm"> -->
<!-- 												<i class="fa fa-globe fa-lg"></i> - From Web - 2 min ago -->
<!-- 											</p> -->
<!-- 										</div> -->
<!-- 										<p>Duis autem vel eum iriure dolor in hendrerit in vulputate ?</p> -->
<!-- 										<div> -->
<!-- 											<div class="btn-group"> -->
<!-- 												<a class="btn btn-sm btn-default btn-hover-success" href="javascript:void(0)"><i class="fa fa-thumbs-up"></i></a> <a class="btn btn-sm btn-default btn-hover-danger" href="javascript:void(0)"><i class="fa fa-thumbs-down"></i></a> -->
<!-- 											</div> -->
<!-- 											<a class="btn btn-sm btn-default btn-hover-primary" href="javascript:void(0)">Comment</a> -->
<!-- 										</div> -->
<!-- 									</div> -->
<!-- 								</div> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 					</div> -->
					<!--===================================================-->
					<!-- End Newsfeed Content -->
				</div>
			</div>
		</div>
	</div>
</body>
</html>