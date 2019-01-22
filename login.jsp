<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
request.setCharacterEncoding("UTF-8");
String value_same=request.getParameter("same");
String redmine_id=request.getParameter("redmineid");
String redmine_pw=request.getParameter("redminepw");
String jenkins_id="";
String jenkins_pw="";

if(value_same.equals("on")){
	jenkins_id=redmine_id;
	jenkins_pw=redmine_pw;
}else{
	jenkins_id=request.getParameter("jenkinsid");
	jenkins_pw=request.getParameter("jenkinspw");
}

%>

<!DOCTYPE html>
<html>

<head>
	<title>SWV</title>
	<script language="javascript">
		var chkRedmine = 0;//0:loading, 1:login success, 2:login failed
		var chkJenkins = 0;
		var alertLogout = 0;
		
		function checkRedmine(){
			var func_name = "checkRedmine()";
			var iframe_name = "frame_redmine";
			var iframe = document.getElementById(iframe_name);
			var rd = document.getElementById(iframe_name).contentDocument;
			
			if(rd.readyState == "complete"){
				if(rd.getElementById("username")!=null){
					chkRedmine = 2;
				} else {
					chkRedmine = 1;
				}
			} else {
				console.log(func_name);
				setTimeout(func_name, 1000);
			}
		}
		
		function checkJenkins(){
			var func_name = "checkJenkins()";
			var iframe_name = "frame_jenkins";
			var iframe = document.getElementById(iframe_name);
			var rd = document.getElementById(iframe_name).contentDocument;
			
			if(rd.readyState == "complete"){
				if(rd.title=="Login Error [Jenkins]"){
					chkJenkins = 2;
				} else {
					chkJenkins = 1;
				}
			} else {
				console.log(func_name);
				setTimeout(func_name, 1000);
			}
		}
		
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
		
		function checkLogin(){
			if(chkRedmine!=0 && chkJenkins!=0){ //loaing complete
				if(chkRedmine==2 && chkJenkins==1){ //redmine failed
					alert("redmine login failed");
					document.getElementById("frame_jenkins").src = "/jenkins/logout";
					location.href='/index.jsp';
				} else if(chkRedmine==1 && chkJenkins==2){ //jenkins failed
					alert("jenkins login failed");
					document.getElementById("frame_redmine").src = "/redmine/logout";
					setTimeout("logoutRedmine()", 100);
				} else if(chkRedmine==2 && chkJenkins==2){ //all failed
					alert("redmine&jenkins login failed");
					location.href='/index.jsp';
				} else { //success
					location.href='main.jsp';
				}
			} else {
				console.log("checkLogin()");
				setTimeout("checkLogin()", 1000);
			}
		}
		
		function loginStart(){
			var rfd = document.getElementById("frame_redmine").contentDocument;
			var jfd = document.getElementById("frame_jenkins").contentDocument;
			
			if(rfd.readyState == "complete" && rfd.readyState == "complete"){
				//로그인 되어있는게 있는지 체크
				if( rfd.getElementById("username")==null){ //레드마인이 로그인 되어 있다면
					location.href='logout.jsp?error=1';
				}
				else if(jfd.getElementsByTagName("title")[0].innerHTML!="로그인 [Jenkins]"){
					if( jfd.getElementsByTagName("a")[3].getAttribute("href")=="/jenkins/logout"){ //젠킨스가 로그인 되어 있다면
					location.href='logout.jsp?error=2';
					}
				}
				else {
	 				rfd.getElementById("username").value="<%=redmine_id%>";
					rfd.getElementById("password").value="<%=redmine_pw%>";
					console.log(rfd.forms[0]);
					rfd.forms[2].submit();
					jfd.getElementById("j_username").value="<%=jenkins_id%>";
					jfd.getElementsByName("j_password")[0].value="<%=jenkins_pw%>";
					jfd.getElementsByName("login")[0].submit();
					setTimeout("checkRedmine()", 1000);
					setTimeout("checkJenkins()", 1000);
					setTimeout("checkLogin()", 1000);
				}
			} else {
				setTimeout("loginStart()", 1000);
			}
		}
		
		window.onload = function(){
			setTimeout("loginStart()", 1000);
		}
	</script>
</head>

<body>
<div id="msg" align="center" style="position: relative; top: 200px;">
	<img src="loading.gif"/>
</div>
<div style="display:none">
	<iframe id="frame_redmine" src="/redmine/login" style="width:100%;height:700px;"></iframe>
	<iframe id="frame_jenkins" src="/jenkins/login" style="width:100%;height:700px;"></iframe>
</div>
</body>

</html>
