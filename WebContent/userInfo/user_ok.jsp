<%@page import="test.jsp.study.db.DBCon"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
String uiName = request.getParameter("uiName");
String uiId = request.getParameter("uiId");
String uiAge = request.getParameter("uiAge");
String uiEtc = request.getParameter("uiEtc");

String sql = "insert into user_info";
sql += " (ui_num,ui_name,ui_id,ui_age,ui_etc)";
sql += " values(seq_ui_num.nextval,?,?,?,?)";

PreparedStatement ps = DBCon.getCon().prepareStatement(sql);
ps.setString(1,uiName);
ps.setString(2,uiId);
ps.setInt(3,Integer.parseInt(uiAge));
ps.setString(4,uiEtc);
int cnt = ps.executeUpdate();
String result = "등록 실패";
if(cnt==1) {
	result = "등록 성공";
	}
%>

<script>
alert("<%=result%>");
location.href="/jsp-study/userInfo/user_list.jsp";
</script>