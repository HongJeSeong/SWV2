<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>개발 진행현황</title>
<style>
  .table-head{
    border-top: 1px solid #000000;
    border-bottom: 1px solid #000000;
    border-left: 1px solid #ededed;
    border-right: 1px solid #ededed;
    align:center;
    width:100%;
    height:100%;
  }
  .table-row{
    text-align:center;
  }
  .color-back{
    background:#ededed;
  }
  .content td{
    border-bottom: 1px solid #ededed;
  }
  /* char bar */
  .graph {
      position: relative; /* IE is dumb */
      width: 100%;
      border: 1px solid #ffd01f;
      padding: 0.5px;
  font-size:11px;
  font-family:tahoma;
  margin-bottom:2px;
  }
  .graph .bar {
      display: block;
      position: relative;
      background: #ffd01f;
      text-align: center;
      color: #333;
      height: 2em;
      line-height: 2em;
  }
  .graph .bar span { position: absolute; left: 1em; }
</style>

<script src="http://code.jquery.com/jquery-1.10.2.js"></script>

<script type="text/javascript" language="javascript">
        function build(name){
                var res;
                 $.ajax({
                     type: 'get'
                     , url: ''
                     , async: false
                     , dataType : 'html'
                     , success: function(data) {
                      var str = document.getElementById(name);
                          $('#data').text(data);
                      var data = $(data).find('.build-caption').text();
                      var index = data.indexOf('(');
                      data = data.substring(index-1);

                       res=data;
                       str.innerHTML=res;
                      }
                 });
                          return res;
         }

        function diffDay(build,start,total,id){
                var dateReplace = build.replace(/\(/gi,'').replace(/\./gi,'');
                dateReplace=dateReplace.trim();
                var dateString = dateReplace.split(" ");
                var dateObj = new Date(dateString[0],Number(dateString[1])-1,dateString[2]);
                var buildDate = dateObj.getTime();
                var betweenDay = (buildDate - start)/total;
                var result = (betweenDay/(1000*3600*24))*100;
                var td = document.getElementById(id+"day");
                var val = Math.round(result)
                var bar = "<div class='graph'><strong class='bar' style='width:"+val+"%;'>"+val+"%</strong></div>";
                td.innerHTML=bar;//round methods


                               }


</script>
</head>
<body>
  <h1 align="center">개발 진행현황</h1>
  <div>
  <div align="left">
 <form>
    건수:0건&nbsp;■사업 연도:
<select name="">
    <option value="all"  selected="selected">전체보기</option>
    <option value="">??</option>
    <option value="">??</option>
    <option value=""></option>
</select>
    ■프로젝트 종류:
    <select name="">
        <option value="all"  selected="selected">전체보기</option>
        <option value="">??</option>
        <option value="">??</option>
        <option value=""></option>
    </select>
  ■사업 명:
<input type="text"/>
<button>검색</button>
</form>
  </div>
  </div>
<table class="table-head" >

    <tr class="table-row color-back">
      <td rowspan="3">상태</td>
      <td rowspan="3">프로젝트명</td>
      <td rowspan="3">프로젝트구분</td>
      <td colspan="3">프로젝트기간</td>
      <td rowspan="3">투입인원</td>
      <td rowspan="3">개발언어</td>
      <td colspan="5">추진현황</td>
    </tr>
    <tr class="table-row color-back">
     <td rowspan="2">시작</td>
     <td rowspan="2">종료</td>
     <td rowspan="2">기간<br>(월)</td>
     <td rowspan="2">최종 빌드일</td>
     <td rowspan="2">사업기간 결과<br>사업추진 현황</td>
     <td rowspan="2">요구사항(완료/총)</td>
     <td rowspan="2">간트차트</td>
     <td rowspan="2">가시화</td>
    </tr>
    <tr class="table-row color-back">
    </tr>
      <%
      Connection conn = null;
      PreparedStatement pstmt = null;
      PreparedStatement pstmt2 = null;
      PreparedStatement pstmt3 = null;

      try{
         String jenkinsURL = "";
         String user="";
         String password = "";

        // String build = scrape(jenkinsURL, user, password);

         String url = "";
         String id = "";
         String pw = "";
         Class.forName("com.mysql.jdbc.Driver");
         conn=DriverManager.getConnection(url,id,pw);

         String sql = "select id,name,description, identifier FROM projects;";
         String sql_req1 = "SELECT count(*) cnt From issues WHERE tracker_id = 6 AND project_id=?;";
         String sql_req2 = "SELECT count(*) cnt FROM issues WHERE tracker_id = 6 AND done_ratio=100 AND project_id=?;";
         pstmt = conn.prepareStatement(sql);
         ResultSet rs = pstmt.executeQuery();
         ResultSet rs2 = null;
         ResultSet rs3 = null;

         String name ="";
         String description = null;
         String status = null;
         String projectType = null;
         String projectStart = null;
         String projectEnd = null;
         String projectManPow = null;
         String projectLanguage = null;
         String graph = "graph";
         String identifier = null;
         while(rs.next()){
                String output= "";
                id=rs.getString("id");
                name=rs.getString("name");
                description = rs.getString("description");
                identifier = rs.getString("identifier");

                // Project Description from Redmine
                description = description.split("- ")[1].trim();
                status = description.split(",")[1];
                projectType = description.split(",")[2];
                projectStart = description.split(",")[3];
                projectEnd = description.split(",")[4];
                projectLanguage = description.split(",")[5];
                projectManPow = description.split(",")[6];
                SimpleDateFormat formatter = new SimpleDateFormat("yyyy/MM/dd");
                Date buildDate = formatter.parse("2019/04/10");
                Date startDate = formatter.parse(projectStart);
                Date endDate = formatter.parse(projectEnd);
                long diff = endDate.getTime() - startDate.getTime();
                long diffDays = diff / (24 * 60 * 60 * 1000);
                long diffMonth = (diffDays + 1 ) /30;
                output += "<tr class=" + "\"" + "table-row content" + "\"" + ">";
                        output+="<td>" + status + "</td>" + "<td>" + name + "</td>" + "<td>" + projectType + "</td>" + "<td>" + projectStart + "</td>" + "<td>" + projectEnd + "</td>" + "<td>" + diffMonth + "</td>" + "<td>" + projectManPow + "</td>" + "<td>" + projectLanguage + "</td>" + "<td id='"+name+"'></td>" + "<td id='"+name+"day'><script>diffDay(build('"+name+"'),"+startDate.getTime()+","+diffDays+",'"+name+"');</script></td>";
                pstmt2 = conn.prepareStatement(sql_req1);
                pstmt2.setInt(1, Integer.parseInt(id));
                rs2 = pstmt2.executeQuery();
                String reqTotal = null;
                if(rs2.next()){
                        reqTotal = rs2.getInt("cnt")+"";
                }

                pstmt3 = conn.prepareStatement(sql_req2);
                pstmt3.setInt(1, Integer.parseInt(id));
                rs3 = pstmt3.executeQuery();
                String reqDone = null;
                if(rs3.next()){
                        reqDone = rs3.getInt("cnt")+"";
                }
                output += "<td>" + reqDone + " / " + reqTotal + "</td>";
                output += "<td>" + "<a href=" + "\"" + "/redmine/projects/" + identifier + "/issues/gantt" + "\"" + "><img width=30 height=30 src=" + "\"" + "gant.png" + "\"" + "/></a>" + "</td>"
                        + "<td><a href=" + "\"" + "./dashboard.jsp#" +name+ "\"" + "><img width=30 height=30 src=" + "\"" + "visual.png" + "\"" + "</td></tr>";
                out.println();
                out.println(output);
         }
         pstmt.close();
         rs.close();
         pstmt2.close();
         rs2.close();
         pstmt3.close();
         rs3.close();
         conn.close();
         }catch(Exception e){
                e.printStackTrace();
         }
      %>
</table>
</body>
</html>
