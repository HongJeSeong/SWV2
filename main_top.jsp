<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
        <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>

        <style>

        body {
                margin:0px;
                background-color:black;
                color:white;

        }
        a:link{
                color:white;
                text-decoration:none;
        }
        a:visited{
                color:white;
                text-decoration:none;
        }
        a:hover{
                color:white;
                text-decoration:underline;
        }
        a:active{
                color:white;
                text-decoration:none;
        }

        </style>
</head>

<body>
        <table width="100%" height="100%">
                <tr>
                        <td width="200" align="center"><b>SElab SP</b></td>
                        <td>
                                   <a href="#" id="current" onclick="showPopup('web/guides.html')">Guide</a>
                        </td>
                        <td width="190">
                                <a href="/redmine" target="main_bottom">Project Management</a>
                        </td>
                        <td width="200">
                                <a href="/jenkins" target="main_bottom">Continuous Integration</a>
                        </td>
                        <td width="130">
                                <a href="dashboard.jsp" target="main_bottom">Dashboard</a>
                        </td>
                        <td width="170">
                                <a href="setTraceability.html" target="main_bottom">Traceability Setting</a>
                        </td>
                        <td width="170">
                                <a href="TraceabilityViewerMain.html" target="main_bottom">Traceability Viewer</a>
                        </td>
                        <td width="100">
                                <a href="logout.jsp" target="_parent">Logout</a>
                        </td>
                </tr>
        </table>

        <script type="text/javascript">
     $(".d1 ul li").hover(function() {
       $(this).find("ul").stop().fadeToggle(500);
     });
         function showPopup(url) { window.open(url, "a", "width=1024px, height=800px"); }
   </script>

</body>

</html>
