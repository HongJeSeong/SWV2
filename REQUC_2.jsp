<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1"/>
        <title>Title</title>
        <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" />
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <meta charset="UTF-8">
        <style type="text/css">
            input[type=submit]{
                padding: 7px 20px 7px 20px;
                text-align: center;
                font-size: 15px;
                border-radius: 5px;
            }
            input[type=submit]:hover{
                cursor: pointer;
                background: linear-gradient(#333333 5%, #777777 100%);
                color: #ffffff;
            }
            .tooltip-inner{
                max-width: 500px;
            }
        </style>

    </head>
    <body>
        <div align="center" width="100%" style="height:100%; text-align:center; vertical-align:middle;">
                <%@ page import = "java.sql.*" %>
                <%@ page import = "java.util.Collections" %>
                <%@ page import = "java.util.ArrayList" %>
                        <%
                        request.setCharacterEncoding("UTF-8");
                        String proj_name=request.getParameter("proj_name");
                        Connection connDB = null;
                        Connection connTrace = null;
                        PreparedStatement pstmtDB = null;
                        PreparedStatement pstmtTrace = null;
                        try{
                                String urlDB = "jdbc:mysql://localhost:3307/redmine";
                                String urlTrace="jdbc:mysql://localhost:3307/traceability";
                                String id = "***";
                                String pw = "***";
                                ResultSet rs;
                                Class.forName("com.mysql.jdbc.Driver");
                                connDB=DriverManager.getConnection(urlDB,id,pw);
                                connTrace=DriverManager.getConnection(urlTrace,id,pw);
                                String sql1 = "DELETE FROM artifacts_info WHERE project_id="+proj_name+" and artifact_name like 'REQ%';";
                                String sql2 = "DELETE FROM artifacts_info WHERE project_id="+proj_name+" and artifact_name like 'UC%';";
                                String sql3 = "SELECT a.project_id, b.customized_id, b.value FROM issues AS a, custom_values AS b WHERE a.project_id="+proj_name+" and a.id=b.customized_id and b.value LIKE 'REQ%';";
                                String sql4 = "SELECT a.project_id, b.customized_id, b.value FROM issues AS a, custom_values AS b WHERE a.project_id="+proj_name+" and a.id=b.customized_id and b.value LIKE 'UC%';";
                                pstmtTrace = connTrace.prepareStatement(sql1);
                                pstmtTrace.executeQuery();
                                pstmtTrace = connTrace.prepareStatement(sql2);
                                pstmtTrace.executeQuery();
                                pstmtDB = connDB.prepareStatement(sql3);
                                rs = pstmtDB.executeQuery();
                                String project_id="";
                                String value ="";
                        while(rs.next()){
                                project_id=rs.getString("project_id");
                                id=rs.getString("customized_id");
                                value = rs.getString("value");
                                pstmtTrace = connTrace.prepareStatement("INSERT INTO artifacts_info VALUES (NULL, "+project_id+", "+id+", '"+value+"');");
                                pstmtTrace.executeQuery();
                        }
                                pstmtDB = connDB.prepareStatement(sql4);
                                rs = pstmtDB.executeQuery();
                        while(rs.next()){
                                project_id=rs.getString("project_id");
                                id=rs.getString("customized_id");
                                value = rs.getString("value");
                                pstmtTrace = connTrace.prepareStatement("INSERT INTO artifacts_info VALUES (NULL, "+project_id+", "+id+", '"+value+"');");
                                pstmtTrace.executeQuery();
                        }
                        int value_count = 0;
                        int value_count2 = 0;
                        ArrayList<String> name_req = new ArrayList<String>();
                        ArrayList<String> name_uc = new ArrayList<String>();
                        pstmtTrace = connTrace.prepareStatement("SELECT artifact_name FROM artifacts_info WHERE project_id = "+proj_name+" and artifact_name LIKE 'REQ%';");
                        rs = pstmtTrace.executeQuery();
                        while(rs.next()){
                                name_req.add(rs.getString("artifact_name"));
                                value_count++;
                        }
                        pstmtTrace = connTrace.prepareStatement("SELECT artifact_name FROM artifacts_info WHERE project_id = "+proj_name+" and artifact_name LIKE 'UC%';");
                        rs = pstmtTrace.executeQuery();
                        while(rs.next()){
                                name_uc.add(rs.getString("artifact_name"));
                                value_count2++;
                        }
                        Collections.sort(name_req);
                        Collections.sort(name_uc);
                        out.println("<form action='ReqUCModify.jsp?proj_name="+proj_name+"' method='post'><table cellpadding='5' cellspacing='0' border='1' style='border-style: solid; border-width: 1px; top: 80px; left: 50px; position: absolute; text-align: center; border-color:black; border-radius: 5px;'>");
                        String from="";
                        String to="";
                        for(int i=0; i<=value_count;i++){
                                out.println("<tr>");
                                for(int j=0;j<=value_count2; j++){
                                        if(i==0&&j==0){
                                                out.println("<td></td>");
                                        }else if(i!=0&&j==0){
                                                out.println("<td>"+name_req.get(i-1)+"</td>");
                                        }else if(i==0&&j!=0){
                                                out.println("<td>"+name_uc.get(j-1)+"</td>");
                                        }else{
                                                pstmtTrace = connTrace.prepareStatement("SELECT artifact_id FROM artifacts_info WHERE artifact_name ='"+name_req.get(i-1)+"' and project_id="+proj_name+";");
                                                rs = pstmtTrace.executeQuery();
                                                while(rs.next()){
                                                        from=rs.getString("artifact_id");
                                                }
                                                pstmtTrace = connTrace.prepareStatement("SELECT artifact_id FROM artifacts_info WHERE artifact_name ='"+name_uc.get(j-1)+"' and project_id="+proj_name+";");
                                                rs = pstmtTrace.executeQuery();
                                                while(rs.next()){
                                                        to=rs.getString("artifact_id");
                                                }
                                                pstmtTrace = connTrace.prepareStatement("SELECT EXISTS (SELECT * FROM relation_status WHERE from_id='"+from+"' and to_id='"+to+"') as success;");
                                                rs = pstmtTrace.executeQuery();
                                                String fromto = from+":"+to;
                                                while(rs.next()){
                                                if(rs.getString("success").equals("1")){
                                                        out.println("<td align='center' class='hover' id="+fromto+">0</td>");
                                                        }else{
                                                        out.println("<td align='center' class='hover' id="+fromto+"></td>");
                                                        }
                                                }
                                        }
                           }
                        out.println("</tr>");
                        }
                        out.println("</table>");
                        out.println("<input type='submit' name='submit' value='수정' style=' top: 30px; left: 50px; margin: 0px 0px 0px 0px; position: absolute; '>");
                        out.println("</form>");
                        }catch(Exception e)
                        {
                                e.printStackTrace();
                        }
                        %>

        </div>
    </body>
</html>


<script>
    $(document).ready(function(){
        $('.hover').tooltip({
            title: fetchData,
            html: true,
            placement: 'right'
        });
        function fetchData(){
            var fetch_data = '';
            var element = $(this);
            var id = element.attr("id");
            $.ajax({
                url:"fetch.jsp",
                method:"POST",
                async: false,
                data:{id:id},
                success:function(data){
                    fetch_data = data;
                }
            });
        return fetch_data;
        }
    });
</script>
