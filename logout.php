
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
				location.href='/';
			} else {
				console.log(func_name);
				setTimeout(func_name, 500);
			}
		}

		window.onload = function(){
<?php
	if(isset($_GET['error'])){
		if($_GET['error']=="1") echo 'alert("Login Failed(1). Login Again");';
		else if($_GET['error']=="2") echo 'alert("Login Failed(1). Login Again");';
	}
?>
			logoutRedmine();
		}
	</script>
</head>

<body>
<div id="msg" align="center" style="position: relative; top: 200px;">
	<img src="loading.gif"/>
</div>
<div style="display:none;">
	<iframe id="frame_redmine" src="/redmine/logout" style="width:500px;height:300px;"></iframe>
	<iframe id="frame_jenkins" src="/jenkins/logout" style="width:500px;height:300px;"></iframe>
</div>
</body>

</html>
