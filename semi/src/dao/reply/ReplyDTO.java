package dao.reply;

import java.util.Date;

public class ReplyDTO {
	private int reply_idx;
	private int pa_idx;
	private String reply_content;
	private String in_admin;
	private Date in_date;
	private String up_admin;
	private Date up_date;
	private int dp_cnt;
	
	private int nextval;
	
	
	public int getReply_idx() {
		return reply_idx;
	}
	public void setReply_idx(int reply_idx) {
		this.reply_idx = reply_idx;
	}
	public int getPa_idx() {
		return pa_idx;
	}
	public void setPa_idx(int pa_idx) {
		this.pa_idx = pa_idx;
	}
	public String getReply_content() {
		return reply_content;
	}
	public void setReply_content(String reply_content) {
		this.reply_content = reply_content;
	}
	public String getIn_admin() {
		return in_admin;
	}
	public void setIn_admin(String in_admin) {
		this.in_admin = in_admin;
	}
	public Date getIn_date() {
		return in_date;
	}
	public void setIn_date(Date in_date) {
		this.in_date = in_date;
	}
	public String getUp_admin() {
		return up_admin;
	}
	public void setUp_admin(String up_admin) {
		this.up_admin = up_admin;
	}
	public Date getUp_date() {
		return up_date;
	}
	public void setUp_date(Date up_date) {
		this.up_date = up_date;
	}
	public int getDp_cnt() {
		return dp_cnt;
	}
	public void setDp_cnt(int dp_cnt) {
		this.dp_cnt = dp_cnt;
	}
	public int getNextval() {
		return nextval;
	}
	public void setNextval(int nextval) {
		this.nextval = nextval;
	}
}
