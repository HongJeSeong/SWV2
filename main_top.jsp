<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
        <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>

        <style>
        *{margin: 0; padding: 0;}

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
        .d1 ul li {
    display: inline-block;
    width: 100px;
    text-align: center;
  }
  .d1 ul ul{
    position: absolute;
    display: none;
  }
  .d1 ul ul li {
            display: inline;
            background-color:#333333;
  }

        </style>
</head>

<body>
        <table width="100%" height="100%">
                <tr>
                        <td width="200" align="center"><b>SElab SP</b></td>
                        <td>
                                <div class="d1">
                                   <ul>
                                      <li><a href="#" id="current">Guide</a>
                                         <ul>
                                           <li><a href="#" onclick="showPopup('web/guide_common.html');">Common</a></li>
                                           <li><a href="#" onclick="showPopup('web/guide_home.html');">Home</a></li>
                                           <li><a href="#" onclick="showPopup('web/guide_car.html');">Car</a></li>
                                           <li><a href="#" onclick="showPopup('web/guide_air.html');">Air</a></li>
                                                                         <li><a href="#" onclick="showPopup('web/guide_bigdata.html');">BigData</a></li>
                                                                         <li><a href="#" onclick="showPopup('web/guide_medical.html');">Medical</a></li>
                                                                         <li><a href="#" onclick="showPopup('web/guide_mobile.html');">Mobile</a></li>
                                                                         <li><a href="#" onclick="showPopup('web/guide_secure.html');">Secure</a></li>
                                                                         <li><a href="#" onclick="showPopup('web/guide_smartgrid.html');">SmartGrid</a></li>
                                         </ul>
                                      </li>
                                   </ul>
                                </div>
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
