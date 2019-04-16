<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Traceability Viewer</title>
    <meta name="description" content="Showing bands for the layers in a diagram." />
    <meta charset="UTF-8">
    <script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>

    <style>
        html, body{
          margin: 0;
          padding: 0;
          min-width: 100%;
          width: 100%;
          max-width: 100%;
          min-height: 100%;
          height: 100%;
          max-height: 100%;
        }
        .projectSelect{
          width: 99.9%;
          text-align: center;
          font-weight: bold;
          vertical-align: middle;
        }
        .forward_div{
          border: 1px solid;
          position: relative;
          overflow: auto;
          width: 100%;
          height: 100%;
        }
        .backward_div{
          border: 1px solid;
          position: relative;
          overflow: auto;
          width: 100%;
          height: 100%;
        }
        .artifact_table{
          border: 1px solid;
          position: relative;
          overflow: auto;
          width: 100%;
          height: 100%;
        }
        .document{
          border: 1px solid;
          position: relative;
          overflow: auto;
          width: 100%;
          height: 100%;
        }
        .matrix1{
          border: 1px solid;
          text-align: center;
          font-weight: bold;
          position: relative;
          overflow: auto;
          width: 100%;
          height: 100%;
        }
        .matrix2{
          border: 1px solid;
          text-align: center;
          font-weight: bold;
          position: relative;
          overflow: auto;
          width: 100%;
          height: 100%;
        }
        .matrix3{
          border: 1px solid;
          text-align: center;
          font-weight: bold;
          position: relative;
          overflow: auto;
          width: 100%;
          height: 100%;
        }
        .matrix4{
          border: 1px solid;
          text-align: center;
          font-weight: bold;
          position: relative;
          overflow: auto;
          width: 100%;
          height: 100%;
        }
        .matrix5{
          border: 1px solid;
          text-align: center;
          font-weight: bold;
          position: relative;
          overflow: auto;
          width: 100%;
          height: 100%;
        }
        .matrix6{
          border: 1px solid;
          text-align: center;
          font-weight: bold;
          position: relative;
          overflow: auto;
          width: 100%;
          height: 100%;
        }


        TABLE {
          font-size: 8px;
          margin: auto;
          text-align: center;
        }
    </style>
</head>
<body>
  <%@ page import = "java.sql.*" %>
  <%@ page import = "java.util.Collections" %>
  <%@ page import = "java.util.ArrayList" %>
  <%
  request.setCharacterEncoding("UTF-8");
  String proj_name="2";
  Connection connDB = null;
  Connection connTrace = null;

  PreparedStatement pstmtTrace = null;
  try{
          String urlDB = "";
          String urlTrace="";
          String id = "";
          String pw = "";
          Class.forName("com.mysql.jdbc.Driver");
          connDB=DriverManager.getConnection(urlDB,id,pw);
          connTrace=DriverManager.getConnection(urlTrace,id,pw);
  %>
    <table width="100%" height="100%" cellspacing="0" cellpadding="0" border="1">
    <%
    String sqlREQ = "SELECT artifact_id, artifact_name FROM artifacts_info WHERE project_id = "+proj_name+" and artifact_name LIKE 'REQ%';";
    String sqlFC = "SELECT artifact_id, artifact_name FROM artifacts_info WHERE project_id = "+proj_name+" and artifact_name LIKE 'FC%';";
    String sqlUC = "SELECT artifact_id, artifact_name FROM artifacts_info WHERE project_id = "+proj_name+" and artifact_name LIKE 'UC%';";
    String sqlUS = "SELECT artifact_id, artifact_name FROM artifacts_info WHERE project_id = "+proj_name+" and artifact_name LIKE 'US%';";
    String sqlOB = "SELECT artifact_id, artifact_name FROM artifacts_info WHERE project_id = "+proj_name+" and artifact_name LIKE 'OB%';";
    String sqlMD = "SELECT artifact_id, artifact_name FROM artifacts_info WHERE project_id = "+proj_name+" and artifact_name LIKE 'MD%';";
    String sqlSC = "SELECT artifact_id, artifact_name FROM artifacts_info WHERE project_id = "+proj_name+" and artifact_name LIKE 'SC%';";

    ResultSet rs;
    ResultSetMetaData rsmd;

    ArrayList<String> req = new ArrayList<String>();
    ArrayList<String> req_name = new ArrayList<String>();
    ArrayList<String> uc = new ArrayList<String>();
    ArrayList<String> uc_name = new ArrayList<String>();
    ArrayList<String> us = new ArrayList<String>();
    ArrayList<String> us_name = new ArrayList<String>();
    ArrayList<String> ob = new ArrayList<String>();
    ArrayList<String> ob_name = new ArrayList<String>();
    ArrayList<String> md = new ArrayList<String>();
    ArrayList<String> md_name = new ArrayList<String>();
    ArrayList<String> fc = new ArrayList<String>();
    ArrayList<String> fc_name = new ArrayList<String>();
    ArrayList<String> sc = new ArrayList<String>();
    ArrayList<String> sc_name = new ArrayList<String>();




    ArrayList<String> total_id = new ArrayList<String>();
    ArrayList<String> total_name = new ArrayList<String>();
      pstmtTrace = connTrace.prepareStatement(sqlREQ);
      rs = pstmtTrace.executeQuery();
      rsmd = rs.getMetaData();

      while(rs.next()){
        req.add(rs.getString("artifact_id"));
        req_name.add(rs.getString("artifact_name"));
        total_id.add(rs.getString("artifact_id"));
        total_name.add(rs.getString("artifact_name"));
      }
      pstmtTrace = connTrace.prepareStatement(sqlUC);
      rs = pstmtTrace.executeQuery();
      rsmd = rs.getMetaData();

      while(rs.next()){
        uc.add(rs.getString("artifact_id"));
        uc_name.add(rs.getString("artifact_name"));
        total_id.add(rs.getString("artifact_id"));
        total_name.add(rs.getString("artifact_name"));
      }

      pstmtTrace = connTrace.prepareStatement(sqlUS);
      rs = pstmtTrace.executeQuery();
      rsmd = rs.getMetaData();

      while(rs.next()){
        us.add(rs.getString("artifact_id"));
        us_name.add(rs.getString("artifact_name"));
        total_id.add(rs.getString("artifact_id"));
        total_name.add(rs.getString("artifact_name"));
      }

      pstmtTrace = connTrace.prepareStatement(sqlOB);
      rs = pstmtTrace.executeQuery();
      rsmd = rs.getMetaData();

      while(rs.next()){
        ob.add(rs.getString("artifact_id"));
        ob_name.add(rs.getString("artifact_name"));
        total_id.add(rs.getString("artifact_id"));
        total_name.add(rs.getString("artifact_name"));
      }

      pstmtTrace = connTrace.prepareStatement(sqlMD);
      rs = pstmtTrace.executeQuery();
      rsmd = rs.getMetaData();

      while(rs.next()){
        md.add(rs.getString("artifact_id"));
        md_name.add(rs.getString("artifact_name"));
        total_id.add(rs.getString("artifact_id"));
        total_name.add(rs.getString("artifact_name"));
      }

       pstmtTrace = connTrace.prepareStatement(sqlFC);
      rs = pstmtTrace.executeQuery();
      rsmd = rs.getMetaData();

      while(rs.next()){
        fc.add(rs.getString("artifact_id"));
        fc_name.add(rs.getString("artifact_name"));
        total_id.add(rs.getString("artifact_id"));
        total_name.add(rs.getString("artifact_name"));
      }
      pstmtTrace = connTrace.prepareStatement(sqlSC);
      rs = pstmtTrace.executeQuery();
      rsmd = rs.getMetaData();

      while(rs.next()){
        sc.add(rs.getString("artifact_id"));
        sc_name.add(rs.getString("artifact_name"));
        total_id.add(rs.getString("artifact_id"));
        total_name.add(rs.getString("artifact_name"));
      }



    %>
      <tr>
        <td width="16.666%" height="100%" colspan="1">
          <div class="matrix1"><font style="font-size: 20px">Requirement & Function</font> <br><br>
          <%
          String req_fc="";
          String fromto="";
          out.println("<table cellpadding='5' cellspacing='0' border='1' style='border-style: solid; border-width: 1px; position: absolute; text-align: center; border-color:black; border-radius: 5px;'>");
          for(int i=0; i<=req_name.size();i++){
              out.println("<tr>");
              for(int j=0;j<=fc_name.size(); j++){
              if(i==0&&j==0){
                  out.println("<td></td>");
                }else if(i!=0&&j==0){
                  out.println("<td>"+req_name.get(i-1)+"</td>");
                }else if(i==0&&j!=0){
                  out.println("<td>"+fc_name.get(j-1)+"</td>");
                }else{
                pstmtTrace = connTrace.prepareStatement("SELECT EXISTS (SELECT * FROM relation_status WHERE from_id='"+req.get(i-1)+"' and to_id='"+fc.get(j-1)+"') as success;");
                rs = pstmtTrace.executeQuery();
                fromto = req.get(i-1)+":"+fc.get(j-1);
                while(rs.next()){
                  if(rs.getString("success").equals("1")){
                      req_fc += fromto+",";
                      out.println("<td onclick='findStartPoint(this);' align='center' class='hover' id='"+fromto+"'>O</td>");
                  }else {
                      out.println("<td align='center' class='hover' id='"+fromto+"'></td>");
                  }
                }
              }
             }
          out.println("</tr>");
          }
          out.println("</table>");
          %>
        </div>
        </td>
        <td width="16.666%">
          <div class="matrix2"><font style="font-size: 20px">Function & UseCase</font> <br><br>
          <%
          String fc_uc="";
          out.println("<table cellpadding='5' cellspacing='0' border='1' style='border-style: solid; border-width: 1px; position: absolute; text-align: center; border-color:black; border-radius: 5px;'>");
          for(int i=0; i<=fc_name.size();i++){
              out.println("<tr>");
              for(int j=0;j<=uc_name.size(); j++){
              if(i==0&&j==0){
                  out.println("<td></td>");
                }else if(i!=0&&j==0){
                  out.println("<td>"+fc_name.get(i-1)+"</td>");
                }else if(i==0&&j!=0){
                  out.println("<td>"+uc_name.get(j-1)+"</td>");
                }else{
                pstmtTrace = connTrace.prepareStatement("SELECT EXISTS (SELECT * FROM relation_status WHERE from_id='"+fc.get(i-1)+"' and to_id='"+uc.get(j-1)+"') as success;");
                rs = pstmtTrace.executeQuery();
                fromto = fc.get(i-1)+":"+uc.get(j-1);
                while(rs.next()){
                  if(rs.getString("success").equals("1")){
                      fc_uc += fromto+",";
                      out.println("<td onclick='findStartPoint(this);' align='center' class='hover' id='"+fromto+"'>O</td>");
                  }else {
                      out.println("<td align='center' class='hover' id='"+fromto+"'></td>");
                  }
                }
              }
             }
          out.println("</tr>");
          }
          out.println("</table>");
          %>
          </div>
        </td>
        <td width="16.666%">
          <div class="matrix3"><font style="font-size: 20px">UseCase & UseCase Scenario</font> <br><br>
          <%
          String uc_us="";
          out.println("<table cellpadding='5' cellspacing='0' border='1' style='border-style: solid; border-width: 1px; position: absolute; text-align: center; border-color:black; border-radius: 5px;'>");
          for(int i=0; i<=uc_name.size();i++){
              out.println("<tr>");
              for(int j=0;j<=us_name.size(); j++){
              if(i==0&&j==0){
                  out.println("<td></td>");
                }else if(i!=0&&j==0){
                  out.println("<td>"+uc_name.get(i-1)+"</td>");
                }else if(i==0&&j!=0){
                  out.println("<td>"+us_name.get(j-1)+"</td>");
                }else{
                pstmtTrace = connTrace.prepareStatement("SELECT EXISTS (SELECT * FROM relation_status WHERE from_id='"+uc.get(i-1)+"' and to_id='"+us.get(j-1)+"') as success;");
                rs = pstmtTrace.executeQuery();
                fromto = uc.get(i-1)+":"+us.get(j-1);
                while(rs.next()){
                  if(rs.getString("success").equals("1")){
                      uc_us += fromto+",";
                      out.println("<td onclick='findStartPoint(this);' align='center' class='hover' id='"+fromto+"'>O</td>");
                  }else {
                      out.println("<td align='center' class='hover' id='"+fromto+"'></td>");
                  }
                }
              }
             }
          out.println("</tr>");
          }
          out.println("</table>");
          %>
          </div>
        </td>
        <td width="16.666%">
          <div class="matrix4"><font style="font-size: 20px">UseCase Scenario & Object</font> <br><br>
          <%
          String us_ob="";
          out.println("<table cellpadding='5' cellspacing='0' border='1' style='border-style: solid; border-width: 1px; position: absolute; text-align: center; border-color:black; border-radius: 5px;'>");
          for(int i=0; i<=us_name.size();i++){
              out.println("<tr>");
              for(int j=0;j<=ob_name.size(); j++){
              if(i==0&&j==0){
                  out.println("<td></td>");
                }else if(i!=0&&j==0){
                  out.println("<td>"+us_name.get(i-1)+"</td>");
                }else if(i==0&&j!=0){
                  out.println("<td>"+ob_name.get(j-1)+"</td>");
                }else{
                pstmtTrace = connTrace.prepareStatement("SELECT EXISTS (SELECT * FROM relation_status WHERE from_id='"+us.get(i-1)+"' and to_id='"+ob.get(j-1)+"') as success;");
                rs = pstmtTrace.executeQuery();
                fromto = us.get(i-1)+":"+ob.get(j-1);
                while(rs.next()){
                  if(rs.getString("success").equals("1")){
                      us_ob += fromto+",";
                      out.println("<td onclick='findStartPoint(this);' align='center' class='hover' id='"+fromto+"'>O</td>");
                  }else {
                      out.println("<td align='center' class='hover' id='"+fromto+"'></td>");
                  }
                }
              }
             }
          out.println("</tr>");
          }
          out.println("</table>");

          %>
          </div>
        </td>
         <td width="16.666%">
          <div class="matrix5"><font style="font-size: 20px">Object & Method</font> <br><br>
          <%
          String ob_md="";
          out.println("<table cellpadding='5' cellspacing='0' border='1' style='border-style: solid; border-width: 1px; position: absolute; text-align: center; border-color:black; border-radius: 5px;'>");
          for(int i=0; i<=ob_name.size();i++){
                out.println("<tr>");
              for(int j=0;j<=md_name.size(); j++){
              if(i==0&&j==0){
                  out.println("<td></td>");
                }else if(i!=0&&j==0){
                  out.println("<td>"+ob_name.get(i-1)+"</td>");
                }else if(i==0&&j!=0){
                  out.println("<td>"+md_name.get(j-1)+"</td>");
                }else{
                pstmtTrace = connTrace.prepareStatement("SELECT EXISTS (SELECT * FROM relation_status WHERE from_id='"+ob.get(i-1)+"' and to_id='"+md.get(j-1)+"') as success;");
                rs = pstmtTrace.executeQuery();
                fromto = ob.get(i-1)+":"+md.get(j-1);
                while(rs.next()){
                  if(rs.getString("success").equals("1")){
                      ob_md += fromto+",";
                      out.println("<td onclick='findStartPoint(this);' align='center' class='hover' id='"+fromto+"'>O</td>");
                  }else {
                      out.println("<td align='center' class='hover' id='"+fromto+"'></td>");
                  }
                }
              }
             }
          out.println("</tr>");
          }
          out.println("</table>");

          %>
          </div>
        </td>
        <td width="16.666%">
          <div class="matrix6"><font style="font-size: 20px">Method & Source</font> <br><br>
          <%
          String md_sc="";
          out.println("<table cellpadding='5' cellspacing='0' border='1' style='border-style: solid; border-width: 1px; position: absolute; text-align: center; border-color:black; border-radius: 5px;'>");
          for(int i=0; i<=md_name.size();i++){
                out.println("<tr>");
              for(int j=0;j<=sc_name.size(); j++){
              if(i==0&&j==0){
                  out.println("<td></td>");
                }else if(i!=0&&j==0){
                  out.println("<td>"+md_name.get(i-1)+"</td>");
                }else if(i==0&&j!=0){
                  out.println("<td>"+sc_name.get(j-1)+"</td>");
                }else{
                pstmtTrace = connTrace.prepareStatement("SELECT EXISTS (SELECT * FROM relation_status WHERE from_id='"+md.get(i-1)+"' and to_id='"+sc.get(j-1)+"') as success;");
                rs = pstmtTrace.executeQuery();
                fromto = md.get(i-1)+":"+sc.get(j-1);
                while(rs.next()){
                  if(rs.getString("success").equals("1")){
                      md_sc += fromto+",";
                      out.println("<td onclick='findStartPoint(this);' align='center' class='hover' id='"+fromto+"'>O</td>");
                  }else {
                      out.println("<td align='center' class='hover' id='"+fromto+"'></td>");
                  }
                }
              }
             }
          out.println("</tr>");
          }
          out.println("</table>");
                        connDB.close();
                        connTrace.close();
                        pstmtTrace.close();
  %>

 </div>
      </tr>
      <tr>
        <td colspan="5">
          <table width="100%" cellpadding='0' cellspacing='0' border='1'>
            <tr>
              <td width="20%" height="300">
                <div class="artifact_table">
                  <table width="250" id="artifacts_table" cellspacing="0" cellpadding="0" border="1" style="font-size: 12px;">
                    <tr>
                      <th width="100">관련 산출물</th>
                    </tr>
                    <tr>
                      <td align="center">선택하세요</td>
                    </tr>
                  </table>
                </div>
              </td>
              <td width="40%" height="300">
                <div class="document"><font style="font-size: 16px; font-weight: bold;">산출물 정보</font>
                  <form action='ReqUCModify.jsp?proj_name=".$proj_name."' method='post'>
                  <table width="100%" height="100%" border="1" id="artifact_information" cellspacing="0" cellpadding="0" border="1" style="font-size: 12px">
                    <tr>
                      <td align="center">선택된 산출물 없음</td>
                    </tr>
                  </table>
                </form>
                </div>
              </td>
              <td width="20%" height="300">
                <div class="backward_div">
                  <font style="font-size: 16px; font-weight: bold;">Backward Traceability</font><br><br>
                  <table width="250" id="backward_traceaility" cellspacing="0" cellpadding="0" border="1" style="font-size: 12px">
                    <tr>
                      <th width="125">이전단계 산출물</th>
                      <th width="125">선택된 산출물</th>
                    </tr>
                    <tr>
                      <td align="center" colspan="2">관련 전체 산출물들을 선택하세요</td>
                    </tr>
                  </table>
                </div>
              </td>
              <td width="20%" height="300">
                <div class="forward_div">
                  <font style="font-size: 16px; font-weight: bold;">Forward Traceability</font><br><br>
                  <table width="250" id="forward_traceaility" cellspacing="0" cellpadding="0" border="1" style="font-size: 12px">
                    <tr>
                      <th width="125"> 선택된 산출물</th>
                      <th width="125"> 다음단계 산출물</th>
                    </tr>
                    <tr>
                      <td align="center" colspan="2">관련 전체 산출물들을 선택하세요</td>
                    </tr>
                  </table>
                </div>
              </td>
            </tr>
          </table>
        </td>
      </tr>
    </table>
    <script type='text/javascript'>
            var req = '<%=req%>';
            var reqFC = '<%=req_fc%>';
            var array_reqFC = reqFC.split(',');
            var fc = '<%=fc%>';
            var fcUC = '<%=fc_uc%>';
            var array_fcUC = fcUC.split(',');
            var uc = '<%=uc%>';
            var ucUS = '<%=uc_us%>';
            var array_ucUS = ucUS.split(',');
            var us = '<%=us%>';
            var usOB = '<%=us_ob%>';
            var array_usOB = usOB.split(',');
            var ob = '<%=ob%>';
            var obMD = '<%=ob_md%>';
            var array_obMD = obMD.split(',');
            var md = '<%=md%>';
            var mdSC = '<%=md_sc%>';
            var array_mdSC = mdSC.split(',');
            var sc = '<%=sc%>';

            var total_id = '<%=total_id%>';
            var total_name = '<%=total_name%>';
            //for(var a=0; a<total_name.length; a++){
            //  alert(total_id[a]+total_name[a]);
            //}

            var allId = new Array();
            var allName = new Array();
            var artifactsClickCount = 0;

        function modifyArray(id){
          var index = total_id.indexOf(id);
          allName.push(total_name[index]);
        }
        function getBoxValue(){
            var e = document.getElementById("project");
            var val = e.options[e.selectedIndex].value;
            return val;
        }
        function artifactsAdd(){
          var table = document.getElementById("artifacts_table");
          // tr 개체를 얻어와 속성값을 조절한다.
          table.deleteRow(1);
          for(var i=1; i<allName.length;i++){
            var row = table.insertRow(i);
            var cell = row.insertCell(0);

            cell.innerHTML = allName[i];
            cell.setAttribute("id", allId[i]);
            //alert(cellid.id);
          }
        }

        function createAtomicTraceability(id){
          var forTrace = document.getElementById("forward_traceaility");
          var backTrace = document.getElementById("backward_traceaility");
          var flag = 0;
          var relation_for = new Array();
          var relation_back = new Array();
          // tr 개체를 얻어와 속성값을 조절한다.
          if(req.includes(id)){
            flag = 1;
            for(var i=0; i<array_reqFC.length-1; i++){
              if(array_reqFC[i].includes(id+":")){
                relation_for.push(array_reqFC[i].split(":")[1]);
                relation_back.push("이전 단계 없음");
              }
            }
            //for(var i=0; i<relation_for.length; i++){
            //  console.log("result["+i+"] "+relation_for[i]);
            //}
          }
          else if(fc.includes(id)){
            flag = 2;
            for(var i=0; i<array_reqFC.length-1; i++){
              if(array_reqFC[i].includes(":"+id)){
                relation_back.push(array_reqFC[i].split(":")[0]);
              }
            }
            for(var i=0; i<array_fcUC.length-1; i++){
              if(array_fcUC[i].includes(id+":")){
                relation_for.push(array_fcUC[i].split(":")[1]);
              }
            }
          }
          else if(uc.includes(id)){
            flag = 3;
            for(var i=0; i<array_fcUC.length-1; i++){
              if(array_fcUC[i].includes(":"+id)){
                relation_back.push(array_fcUC[i].split(":")[0]);
              }
            }
            for(var i=0; i<array_ucUS.length-1; i++){
              if(array_ucUS[i].includes(id+":")){
                relation_for.push(array_ucUS[i].split(":")[1]);
              }
            }
          }
          else if(us.includes(id)){
            flag = 4;
            for(var i=0; i<array_ucUS.length-1; i++){
              if(array_ucUS[i].includes(":"+id)){
                relation_back.push(array_ucUS[i].split(":")[0]);
              }
            }
            for(var i=0; i<array_usOB.length-1; i++){
              if(array_usOB[i].includes(id+":")){
                relation_for.push(array_usOB[i].split(":")[1]);
              }
            }
          }
          else if(ob.includes(id)){
            flag = 5;
            for(var i=0; i<array_usOB.length-1; i++){
              if(array_usOB[i].includes(":"+id)){
                relation_back.push(array_usOB[i].split(":")[0]);
              }
            }
            for(var i=0; i<array_obMD.length-1; i++){
              if(array_obMD[i].includes(id+":")){
                relation_for.push(array_obMD[i].split(":")[1]);
              }
            }

          }
          else if(md.includes(id)){
            flag = 6;
            for(var i=0; i<array_obMD.length-1; i++){
              if(array_obMD[i].includes(":"+id)){
                relation_back.push(array_obMD[i].split(":")[0]);
              }
            }
            for(var i=0; i<array_mdSC.length-1; i++){
              if(array_mdSC[i].includes(id+":")){
                relation_for.push(array_mdSC[i].split(":")[1]);
              }
            }

          }
         else if(sc.includes(id)){
            flag = 7;
            for(var i=0; i<array_mdSC.length-1; i++){
              if(array_mcSC[i].includes(":"+id)){
                relation_back.push(array_mdSC[i].split(":")[0]);
                relation_for.push("다음 단계 없음");
              }
            }
          }


          forTrace.deleteRow(1);
          backTrace.deleteRow(1);

          for(var i=1; i<=relation_for.length;i++){
            var row = forTrace.insertRow(i);
            var cell1 = row.insertCell(0);
            var index0 = total_id.indexOf(id);
            var cell2 = row.insertCell(1);
            var index = total_id.indexOf(relation_for[i-1]);

            if(index != -1){
              cell1.innerHTML = total_name[index0];
            }else{
              cell1.innerHTML = total_name[index0];
              cell2.innerHTML = relation_for[0];
              break;
            }
            cell2.innerHTML = total_name[index];
            cell2.setAttribute("id", relation_for[i-1]+"!");
          }
          for(var i=1; i<=relation_back.length;i++){
            var row = backTrace.insertRow(i);
            var cell1 = row.insertCell(0);
            var index = total_id.indexOf(relation_back[i-1]);

            if(index != -1){
              cell1.innerHTML = total_name[index];
              cell1.setAttribute("id", relation_back[i-1]+"!");
            }else{
              cell1.innerHTML = relation_back[0];
              var cell2 = row.insertCell(1);

              var index0 = total_id.indexOf(id);
              cell2.innerHTML = total_name[index0];
              break;
            }
            var cell2 = row.insertCell(1);
            var index0 = total_id.indexOf(id);
            cell2.innerHTML = total_name[index0];
          }
        }

        function createIssueInfoTable(id, obj){
          var artifactInfo = document.getElementById("artifact_information");

          artifactInfo.deleteRow(0);
          var row1 = artifactInfo.insertRow(0);
          var cell11 = row1.insertCell(0);
          var cell12 = row1.insertCell(1);
          var row2 = artifactInfo.insertRow(1);
          var cell21 = row2.insertCell(0);
          var cell22 = row2.insertCell(1);

          cell11.innerHTML = "<font style='font-size: 14px; font-weight: bold;'>제목</font>";
          cell11.width = "100px";
          cell12.innerHTML = "<input type='text' width='400px' id='"+id+"' value='"+obj['subject']+"' style='width:600px; height:50px;' />";
          cell21.innerHTML = "<font style='font-size: 14px; font-weight: bold;'>내용</font>";
          cell22.innerHTML = "<textarea name='content' style='width:600px; height:208px;' >"+obj["description"]+"</textarea>";
        }

        function OBfor(id){
          for(var i=0; i<array_obMD.length-1;i++){
            if(array_obMD[i].includes(id.split(':')[1])){
              var el = document.getElementById(array_obMD[i]);
              el.style.backgroundColor="pink";
              if(allId.indexOf(array_obMD[i].split(':')[1]) == -1){
                allId.push(array_obMD[i].split(':')[1]);
                modifyArray(array_obMD[i].split(':')[1]);
              }
            }
          }
          return;
        }
        function USfor(id){
          for(var i=0; i<=array_usOB.length-2;i++){
            if(array_usOB[i].includes(id.split(':')[1])){
              var el = document.getElementById(array_usOB[i]);
              el.style.backgroundColor="pink";
              if(allId.indexOf(array_usOB[i].split(':')[1]) == -1){
                allId.push(array_usOB[i].split(':')[1]);
                modifyArray(array_usOB[i].split(':')[1]);
              }
              OBfor(array_usOB[i]);
            }
          }
          return;
        }
        function UCfor(id){
          for(var i=0; i<=array_ucUS.length-2;i++){
            if(array_ucUS[i].includes(id.split(':')[1])){
              var el = document.getElementById(array_ucUS[i]);
              el.style.backgroundColor="pink";
              if(allId.indexOf(array_ucUS[i].split(':')[1]) == -1){
                allId.push(array_ucUS[i].split(':')[1]);
                modifyArray(array_ucUS[i].split(':')[1]);
              }
              USfor(array_ucUS[i]);
            }
          }
          return;
        }
        function UCback(id){
          for(var i=0; i<=array_reqUC.length-2;i++){
            if(array_reqUC[i].includes(id.split(':')[0])){
              var el = document.getElementById(array_reqUC[i]);
              el.style.backgroundColor="pink";
              if(allId.indexOf(array_reqUC[i].split(':')[0]) == -1){
                allId.push(array_reqUC[i].split(':')[0]);
                modifyArray(array_reqUC[i].split(':')[0]);
              }
            }
          }
          return;
        }
        function USback(id){
          for(var i=0; i<=array_ucUS.length-2;i++){
            if(array_ucUS[i].includes(id.split(':')[0])){
              var el = document.getElementById(array_ucUS[i]);
              el.style.backgroundColor="pink";
              if(allId.indexOf(array_ucUS[i].split(':')[0]) == -1){
                allId.push(array_ucUS[i].split(':')[0]);
                modifyArray(array_ucUS[i].split(':')[0]);
              }
              UCback(array_ucUS[i]);
            }
          }
          return;
        }
        function OBback(id){
          for(var i=0; i<=array_usOB.length-2;i++){
            if(array_usOB[i].includes(id.split(':')[0])){
              var el = document.getElementById(array_usOB[i]);
              el.style.backgroundColor="pink";
              if(allId.indexOf(array_usOB[i].split(':')[0]) == -1){
                allId.push(array_usOB[i].split(':')[0]);
                modifyArray(array_usOB[i].split(':')[0]);
              }
              USback(array_usOB[i]);
            }
          }
          return;
        }
        function findStartPoint(el){
          var start = el.id;
          var startpoint = start.split(':');

          var el = document.getElementById(start);
          el.style.backgroundColor="pink";
          if(reqUC.includes(start)){
            allId.push(start.split(':')[0]);
            allId.push(start.split(':')[1]);
            modifyArray(start.split(':')[0]);
            modifyArray(start.split(':')[1]);
            UCfor(start);
          }else if(ucUS.includes(start)){
            allId.push(start.split(':')[0]);
            allId.push(start.split(':')[1]);
            modifyArray(start.split(':')[0]);
            modifyArray(start.split(':')[1]);
            UCback(start);
            USfor(start);
          }else if(usOB.includes(start)){
            allId.push(start.split(':')[0]);
            allId.push(start.split(':')[1]);
            modifyArray(start.split(':')[0]);
            modifyArray(start.split(':')[1]);
            USback(start);
            OBfor(start);
          }else if(obMD.includes(start)){
            allId.push(start.split(':')[0]);
            allId.push(start.split(':')[1]);
            modifyArray(start.split(':')[0]);
            modifyArray(start.split(':')[1]);
            OBback(start);
          }
          artifactsAdd();
        }

        function fetchData(ida){
          var id = ida.split("!")[0];
          var fetch_data = new Array();
            $.ajax({
                url:"getIdInfo.jsp",
                method:"POST",
                async: false,
                data:{id:id},
                success:function(data){
                    fetch_data = data;
                }
            });
          return fetch_data;
        }
        function getIssueInfo(id){
            var result = fetchData(id);
            var jsonObj = JSON.parse(result);
            createIssueInfoTable(id, jsonObj);
        }
        function initArtifacts(){
          for(var i=1; i<allId.length; i++){
            var cell = document.getElementById(allId[i]);
            cell.style.backgroundColor="white";
          }
          var artifactInfo = document.getElementById("artifact_information");
          return;
        }
    </script>
</body>
      <%
      }catch(Exception e)
      {
      e.printStackTrace();
      }

      %>

</html>
<script>
  $("#artifacts_table").on("click", function(cell){
    if(artifactsClickCount==0){
      initArtifacts();
    }
    $cell = $(cell.target);
    $cellId = $cell.attr('id');
    var el2 = document.getElementById($cellId);
    el2.style.backgroundColor="skyblue";
    artifactsClickCount++;
    createAtomicTraceability($cellId);
    getIssueInfo($cellId);
  })
</script>
