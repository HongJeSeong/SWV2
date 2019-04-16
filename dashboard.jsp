<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.Arrays"%>
<%@ page import="java.util.Collections"%>
<!DOCTYPE html>
<html>
      <head>
        <style>
  .table-head{
    border-top: 1px solid #BBBBBB;
    border-bottom: 1px solid #BBBBBB;
    align:center;
    width:800px;
    height:100%;
  }
  .table-row{
        text-align:center;
  }
  .color-back{
        background:#FFFFCC;
  }
  tr {
        height:33px;
  }
  td{
        border: 1px  #BBBBBB;
        border-collapse: collapse;
        text-align:center;
  }
  .index{
        width:80px;
  }
  a {
        text-decoration:none;
        color:#000033;
  }

        </style>
        </head>
<%!
public String naming(String name){
if(name.contains("Coupling")){
        return "Coupling";
}
if(name.contains("BadSmell")){
        return "BadSmell";
}
if (name.contains("ClassDiagram")){
        return "ClassDiagram";
}
if(name.contains("reusability")){
        return "Reusability";
}
return "None";
}
%>
<%
  String fileDir = "dashboard"; //root dir
  String filePath = request.getRealPath(fileDir) + "/"; //path
  String projPath="";
  String contentPath="";
  String projName = request.getParameter("name");

  File f = new File(filePath);
  File [] files = f.listFiles(); //파일의 리스트를 대입

  for ( int i = 0; i < files.length; i++ ) {
    if(files[i].isDirectory()){ //project directory
        String projDir=files[i].getName();
        if(projDir.equals(projName)&&projName!=null){
        projPath=filePath+projDir+"/";
        f = new File(projPath);
        File [] buildDir= f.listFiles();

        out.println("<h1 id='"+projDir+"' style='text-align:center;color:darkgray'>"+projDir+"</h1>");
        out.println("<table class='table-head' align='center'>");
        out.println("<tr class='table-row color-back'><th>Build No.</th><th>Visualization</th>");
        Arrays.sort(buildDir,Collections.reverseOrder());
        for( int j=0;j<buildDir.length;j++){
        if(buildDir[j].isDirectory()){//build number directory
        String content=buildDir[j].getName();
        contentPath= projPath+content+"/";
        f = new File(contentPath);
        File [] contentDir = f.listFiles();
        if(contentDir.length==0)
                continue;
        Arrays.sort(contentDir);
        out.println("<tr>");
        out.println("<td class='index'>" + "<a href='/jenkins/job/"+projDir + "/" + content + "/" + "console'" + ">" + content + "</a></td>");
        out.println("<td style='font-size:16px;'>");
        for(int k = 0; k< contentDir.length;k++){
                String graph = contentDir[k].getName();
                if(graph.contains(".svg")||graph.contains(".png")||graph.contains(".jpg")){
                out.println("<a href='dashboard/"+projDir+"/"+content+"/"+graph+"' target='new'>"+naming(graph)+"</a>&nbsp;&nbsp;");
                }
        }
        out.println("</td>");
        out.println("</tr>");
        }

        }

        out.println("</table>");
        break;
        }
        }else{
                out.println("<h1>No Data!</h1>");
        }

  }
%>

</html>

