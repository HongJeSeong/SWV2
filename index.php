<!DOCTYPE html>
<html>

<head>
	<title>SWV</title>
	<style>
		body{
			background-color:#EFEFEF;
		}
		#main_table {
			//background-color:black;
			//color:white;
		}
		
		p.login {
			padding:8px;
			font-size:13px;
		}

		p.login_title {
			padding-top:50px;
			font-size:22px;
			font-weight:bold;
		}

		input.login {
			width:250px;
			height:40px;
			font-size:16px;
			font-family:맑은 고딕; malgun-godic;
			border-width:1px;
			border-color:back;
			border-style:solid;
		}

		input[type="text"].login {
			border-width:1px 1px 0px 1px;
			border-radius:5px 5px 0px 0px;
			padding:0px 5px 0px 5px;
			font-weight:none;
		}

		input[type="password"].login {
			border-width:1px 1px 1px 1px;
			border-radius:0px 0px 5px 5px;
			padding:0px 5px 0px 5px;
			font-weight:none;
		}

		input[type="button"].login {
			width:250px;
			height:40px;
			border-width:0px;
			border-radius:5px 5px 5px 5px;
			padding:10px;
			margin-top:10px;
			background-color:#A9BACB;
			color:white;
			font-size:16px;
			font-family:맑은 고딕; malgun-godic;
			font-weight:bold;
		}

		input[type="submit"].login {
			width:250px;
			height:40px;
			border-width:0px;
			border-radius:5px 5px 5px 5px;
			padding:10px;
			background-color:#677787;
			color:white;
			font-size:16px;
			font-family:맑은 고딕; malgun-godic;
			font-weight:bold;
		}
	</style>
	<script language="javascript">
		function sameRedmine(){
			var same = document.getElementById("same").checked;
			if(same==true){
				var redmine_id = document.getElementById("redmineid").value;
				var redmine_pw = document.getElementById("redminepw").value;
				
				document.getElementById("jenkinsid").value = "";
				document.getElementById("jenkinspw").value = "";
				
				document.getElementById("jenkinsid").disabled = true;
				document.getElementById("jenkinspw").disabled = true;
			} else {
				document.getElementById("jenkinsid").value = "";
				document.getElementById("jenkinspw").value = "";
				
				document.getElementById("jenkinsid").disabled = false;
				document.getElementById("jenkinspw").disabled = false;
			}
		}
		
		window.onload = function(){
			document.getElementById("same").checked = true;
			sameRedmine();
		};
	</script>
</head>

<body>

<br/>
<br/>
	<form method="post" action="login.php">
	<table id="main_table" align="center" valign="center" width="600" cellpadding="5" cellspacing="0" border="0">
		<tr>
			<td>
				<table width="100%" cellpadding="0" cellspacing="0" border="0">
					<tr>
						<td align="center" height="60"><b>Project Management Tool</b></td>
					</tr>
					<tr>
						<td align="center"><input class="login" type="text" name="redmineid" id="redmineid" placeholder="ID"/></td>
					</tr>
					<tr>
						<td align="center"><input class="login" type="password" name="redminepw" id="redminepw" placeholder="Password"/></td>
					</tr>
				</table>
			</td>
			<td>
				<table width="100%" cellpadding="0" cellspacing="0" border="0">
					<tr>
						<td align="center" height="60"><b>Continuous Integration Tool</b><br/>
						(<input type="checkbox" id="same" name="same" onclick="sameRedmine()"> same login info)</td>
					</tr>
					<tr>
						<td align="center"><input class="login" type="text" name="jenkinsid" id="jenkinsid" placeholder="ID"/></td>
					</tr>
					<tr>
						<td align="center"><input class="login" type="password" name="jenkinspw" id="jenkinspw" placeholder="Password"/></td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center" height="50"><input class="login" type="submit" value="Login"/></td>
		</tr>
	</table>
	</form>
</body>
