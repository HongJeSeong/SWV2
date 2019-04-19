<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%@ page import="org.json.simple.JSONObject"%>

                        <%
                        request.setCharacterEncoding("UTF-8");
                        response.setContentType("application/json");
                        String get_id=request.getParameter("id");
                        Connection connDB = null;
                        PreparedStatement pstmtDB = null;
                        try{
                                String urlDB = "";
                                String id = "";
                                String pw = "";
                                String output="";
                                ResultSet rs;
                                Class.forName("com.mysql.jdbc.Driver");
                                connDB=DriverManager.getConnection(urlDB,id,pw);
                                String sql1 = "SELECT subject, description FROM issues WHERE id='"+get_id+"'";
                                pstmtDB = connDB.prepareStatement(sql1);
                                rs = pstmtDB.executeQuery();

                                JSONObject obj = new JSONObject();

                        while(rs.next()){
                        obj.put("subject",rs.getString("subject"));
                        obj.put("description",rs.getString("description"));
                        }
                        out.print(obj);
                        connDB.close();
                        }catch(Exception e)
                        {
                                e.printStackTrace();
                        }

                        %>
