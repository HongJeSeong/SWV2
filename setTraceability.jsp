<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" />
        <title>전체 프레임</title>
        <style>
            /* 이곳에 CSS 소스코드가 들어가야 합니다. */
            ul.mylist, ol.mylist {
                list-style: none;
                margin: 0px;
                padding: 0px;
                max-width: 250px;
                width: 100%;
            }
            ul.mylist li, ol.mylist li {
                padding: 5px 0px 5px 5px;
                margin-bottom: 5px;
                border-bottom: 1px solid #efefef;
                font-size: 12px;
            }
            ul.mylist li:last-child,ol.mylist li:last-child {
                border-bottom: 0px;
            }
            ul.mylist li:before,ol.mylist li:before {
                content: ">";
                display: inline-block;
                vertical-align: middle;
                padding: 0px 5px 6px 0px;
            }

            #div_root{
                margin:auto;
                width:1200px;
                height:100vh;
                border:1px solid #000000;
                border-radius: 10px;
            }
            #div_menu{
                width:10%;
                height:98.90%;
                float:left;
                background-color: #ccccff;
                text-align: right;
                padding:10px 15px 0px 0px;
                border-top-left-radius: 10px;
                border-bottom-left-radius: 10px;
            }
            #div_content{
                width:88%;
                height:auto;
                overflow:hidden;
                float: left;
                text-align: center;
                vertical-align: middle;
                margin:auto;
            }
            #project{
                width:100px;
            }
            a:link { color:#33348e; text-decoration: none; }
            a:visited { color:#33348e; text-decoration: none; }
            a:hover { color:#33348e; text-decoration: none; }
            a:active { color:#7476b4; text-decoration: underline; }
        </style>
        <script>
            function getBoxValue(){
                var e = document.getElementById("project");
                var val = e.options[e.selectedIndex].value;
                var txt = e.options[e.selectedIndex].text;

                var divId = document.getElementById("block");
                var divId2 = document.getElementById("nics");
                var divId3 = document.getElementById("building");
                divId.style.display="none";
                divId2.style.display="none";
                divId3.style.display="none";

                if(val == 5){
                    divId3.style.display="block";
                }else if(val == 6){
                    divId.style.display="block";
                }else if(val == 7){
                    divId2.style.display="block";
                }
                return val;

            }
            function toSFRSBM(){
                var val = getBoxValue();
                document.getElementById("ifr").src = "SFRSBM.jsp?proj_name="+ val;
            }
            function toSFRPGM(){
                var val = getBoxValue();
                document.getElementById("ifr").src = "SFRPGM.jsp?proj_name="+ val;
            }
            function toSBMPGM(){
                var val = getBoxValue();
                document.getElementById("ifr").src = "SBMPGM.jsp?proj_name="+ val;
            }
            function toPGMUT(){
                var val = getBoxValue();
                document.getElementById("ifr").src = "PGMUT.jsp?proj_name="+ val;
            }
            function toUTTT(){
                var val =getBoxValue();
                document.getElementById("ifr").src = "UTTT.jsp?proj_name="+ val;
            }
            function toReqUC(){
                var val = getBoxValue();
                document.getElementById("ifr").src = "REQUC_2.jsp?proj_name="+ val;
            }
            function toUCUS(){
                var val = getBoxValue();
                document.getElementById("ifr").src = "UCUS_2.jsp?proj_name="+ val;
            }
            function toUSOB(){
                var val = getBoxValue();
                document.getElementById("ifr").src = "USOB_2.jsp?proj_name="+ val;
            }
            function toOBMD(){
                var val =getBoxValue();
                document.getElementById("ifr").src = "OBMD_2.jsp?proj_name="+ val;
            }
        </script>

    </head>
    <body>
        <div id="div_root">
            <div id="div_menu">
                <div>
                    <select id="project">
                        <%@ page import = "java.sql.*" %>
                        <%
                        Connection conn = null;
                        PreparedStatement pstmt = null;

                        try{
                                String url = "jdbc:mysql://localhost:3307/redmine";
                                String id = "root";
                                String pw = "409264";
                                Class.forName("com.mysql.jdbc.Driver");
                                conn=DriverManager.getConnection(url,id,pw);
                                out.println("connect");

                                String sql = "select id,name FROM projects;";
                                String output= "";
                                pstmt = conn.prepareStatement(sql);
                                rs = pstmt.executeQuery();

                        while(rs.next()){
                                String id=rs.getString("id");
                                String name=rs.getString("name");
                                output+="<option value="+id+">"+name+"</option>";
                        }
                                out.println(ouput);

                        }catch(Exception e)
                        {
                                e.printStackTrace();
                        }
                        %>
                    </select>
                    <input type="button" value="조회" onclick="javascript:getBoxValue();" />
                </div>
                <div id="building" style="display:none;">
                    <!-- <nav> -->
                    <ul class="mylist">
                        <li onclick="javascript:toReqUC();"><a href="#"><font size="+1" style="font-weight: bold">RE-UC</font></a></li>
                        <li onclick="javascript:toUCUS();"><a href="#"><font size="+1" style="font-weight: bold">UC-US</font></a></li>
                        <li onclick="javascript:toUSOB();"><a href="#"><font size="+1" style="font-weight: bold">US-OB</font></a></li>
                        <li onclick="javascript:toOBMD();"><a href="#"><font size="+1" style="font-weight: bold">OB-MD</font></a></li>
                    </ul>
                    <!-- </nav> -->
                </div>
                <div id="block" style="display:none;">
                    <!-- <nav> -->
                    <ul class="mylist">
                        <li onclick="javascript:toSFRSBM();"><a href="#"><font size="+1" style="font-weight: bold">SFR-SBM</font></a></li>
                        <li onclick="javascript:toSBMPGM();"><a href="#"><font size="+1" style="font-weight: bold">SBM-PGM</font></a></li>
                        <li onclick="javascript:toPGMUT();"><a href="#"><font size="+1" style="font-weight: bold">PGM-UT</font></a></li>
                        <li onclick="javascript:toUTTT();"><a href="#"><font size="+1" style="font-weight: bold">UT-TT</font></a></li>
                    </ul>
                    <!-- </nav> -->
                </div>
                <div id="nics" style="display:none;">
                    <!-- <nav> -->
                    <ul class="mylist">
                        <li onclick="javascript:toSFRPGM();"><a href="#"><font size="+1" style="font-weight: bold">SFR-PGM</font></a></li>
                        <li onclick="javascript:toPGMUT();"><a href="#"><font size="+1" style="font-weight: bold">PGM-UT</font></a></li>
                        <li onclick="javascript:toUTTT();"><a href="#"><font size="+1" style="font-weight: bold">UT-TT</font></a></li>
                    </ul>
                    <!-- </nav> -->
                </div>
            </div>
            <div id="div_content">
                <iframe id="ifr" frameborder="0" style="position:relative; width:100%; height:100vh;"></iframe>
            </div>
        </div>
    </body>
</html>
