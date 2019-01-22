<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
	<title>SWV</title>
	<script language="javascript">

		function logoutRedmine(){
			var func_name = "logoutRedmine()";
			var iframe_name = "frame_redmine";
			var iframe = document.getElementById(iframe_name);
			var rd = document.getElementById(iframe_name).contentDocument;

			if(rd.readyState == "complete"){
				rd.forms[2].submit();
				location.href='/index.jsp';
			} else {
				console.log(func_name);
				setTimeout(func_name, 500);
			}
		}

		window.onload = function(){
<%	 
	request.setCharacterEncoding("UTF-8");
	String error=request.getParameter("error");
	 if(error.equals("1")){
	 		out.println("alert('Login Failed(1). Login Again');");
	 		 
	 }else if(error.equals("2")){
	 		out.println("alert('Login Failed(2). Login Again');");
	 }
%>
			logoutRedmine();
		}
	</script>
</head>

<body>
<div id="msg" align="center" style="position: relative; top: 200px;">
	<img src="loading.gif"/>
</div>
<div style="">
	<iframe id="frame_redmine" src="/redmine/logout" style="width:100%;height:700px;"></iframe>
	<iframe id="frame_jenkins" src="/jenkins/logout" style="width:100%;height:700px;"></iframe>
</div>
</body>

</html>
