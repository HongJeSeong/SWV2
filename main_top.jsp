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
         .d1 ul li {
    display: inline-block;
    width: 70px;
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
                        <td width="400" align="center"><b>Hongik University SELab. Software Process</b></td>
                        <td>
                                   <a href="#" id="current" onclick="showPopup('web/guides.html')">가이드</a>
                        </td>
                        <td width="190">
                                <a href="/redmine" target="main_bottom">Project Management</a>
                        </td>
                        <td width="200">
                                <a href="/jenkins" target="main_bottom">Continuous Integration</a>
                        </td>
                        <td width="170">
                                <div class="d1">
                                   <ul>
                                      <li><a href="#" id="current">추적성</a>
                                         <ul>
                                   <li><a href="setTraceability.jsp" target="main_bottom">추적성 설정</a></li>
                                           <li><a href="TraceabilityViewerMain.jsp" target="main_bottom">추적성 보기</a></li>
                                         </ul>
                                      </li>
                                   </ul>
                                </div>
                        </td>

                        <td width="130">
                                <a href="dashboard.jsp" target="main_bottom">SW강건성</a>
                        </td>
                        <td width="170">
                                <a href="develop.jsp" target="main_bottom">개발진행 현황</a>
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
