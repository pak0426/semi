let reply = {};

reply.setReplyForm = function(thisObj, act){
	let hidden_reply_content = "";
	
	if(act == "U"){
		hidden_reply_content = $("#reply_"+$("#hidden_reply_idx").val()).find("textarea").val();
	}
	
	if(act == "D"){
		let parent = $(thisObj).parents("div")[2];
		parent_id = $(parent).attr("id");
		parent_id = parent_id.substring(6);
		$("#hidden_reply_idx").val(parent_id);
	}
	
	let data = {
			 pa_idx : $("#webtoon_idx").val()
			,reply_content : $("#reply_content").val()
			,in_admin : $("#session_login_id").val()
			,reply_act : act
			,reply_idx : $("#hidden_reply_idx").val()
			,hidden_reply_content : hidden_reply_content
		};
	
		$.ajax({
			 type : "post"
			,url : "./reply_action.jsp"
			,data : data
			,success : function(result){
				console.log(result);
				if(result.isOk == "Y"){
					alert(result.msg);	
					location.reload();
				}else{
					alert(result.msg);
					location.reload();
				}
			}
			,error : function(request, status, error){
				console.log("code : " + request.status + "\n" + "message :" + request.responseText + "\n" + "error : " + error);
				alert("오류가 발생했습니다. \n다시 시도해주세요.");
				return false;
			}
		});
	}

reply.ajaxModReply = function(thisObj, in_admin, in_date, reply_content){
	
	let parent = $(thisObj).parents("div")[2];
	parent_id = $(parent).attr("id");
	parent_id = parent_id.substring(6);
	
	$("#hidden_reply_idx").val(parent_id);
	
	reply_content = reply_content.replaceAll("<br/>", "\n");
	
	$(parent).children().remove();
	let html = "";
	html += "<div class=\"mar-btm\">                                                                                   ";
	html += "<a href=\"javascript:void(0)\" class=\"btn-link text-semibold media-heading box-inline\" >"+in_admin+"</a>";
	html += "<p class=\"text-muted text-sm\">"+in_date+"</p>                      										 ";
	html += "</div>                                                                                                    ";
	html += "<textarea class=\"form-control\">"+reply_content+"</textarea>                                             ";
	html += "<div style=\"float:right\">                                                                               ";
	html += "<button class=\"btn btn-sm btn-primary\" onclick=\"reply.cancel();\">취소</button>                      ";
	html += "<button class=\"btn btn-sm btn-primary\" onclick=\"reply.setReplyForm('U');\">댓글 수정하기</button>          ";
	html += "</div>                                                                                                    ";
	$(parent).append(html);
}

reply.cancel = function(){
	location.reload();
}

reply.setAgree = function(agree_type, reply_idx, session_login_id){
	console.log(agree_type);
	console.log(reply_idx);
	console.log(session_login_id);
	
	let data = {
			reply_act : "A"
			,agree_type : agree_type
			,reply_idx : reply_idx
			,in_admin : session_login_id
		};
	
		$.ajax({
			 type : "post"
			,url : "./reply_action.jsp"
			,data : data
			,success : function(result){
				console.log(result);
				if(result.isOk == "Y"){
					alert(result.msg);	
					location.reload();
				}else{
					alert(result.msg);
					location.reload();
				}
			}
			,error : function(request, status, error){
				console.log("code : " + request.status + "\n" + "message :" + request.responseText + "\n" + "error : " + error);
				alert("오류가 발생했습니다. \n다시 시도해주세요.");
				return false;
			}
		});
}


