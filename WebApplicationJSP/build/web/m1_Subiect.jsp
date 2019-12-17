<%-- 
    Document   : m1_Subiect
    Created on : Dec 27, 2018, 9:14:44 PM
    Author     : Andrei
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <title>Tabela Subiecte</title>
        <link href="table.css" rel="stylesheet" type="text/css" media="screen" />
    </head>
    <jsp:useBean id="jb" scope="session" class="db.JavaBean" />
    <jsp:setProperty name="jb" property="*" />
    <body style="background-color: black;color: white">
        <h1 align="center">Tabela Subiecte:</h1>
        <br/>
        <p class="w3-button w3-black w3-round-xlarge" align="center"><a href="nou_Subiect.jsp"><b>Adauga un nou subiect.</b></a> <a class="w3-button w3-border w3-hover-teal w3-button w3-round-xlarge" href="index.html"><b>Home</b></a></p>
        <%
            jb.connect();
            int aux = java.lang.Integer.parseInt(request.getParameter("primarykey"));
            ResultSet rs = jb.intoarceLinieDupaId("subiecte", "idsubiecte", aux);
            rs.first();
            String tip = rs.getString("tip");
            String nr_intrebari = rs.getString("nr_intrebari");
           
            rs.close();
            jb.disconnect();
        %>
        <form action="m2_Subiect.jsp" method="post">
            <table align="center">
                <tr>
                    <td align="right">IdSubiect:</td>
                    <td> <input type="text" name="idsubiecte" size="30" value="<%= aux%>" readonly/></td>
                </tr>
                <tr>
                    <td align="right">Tip:</td>
                    <td> <input type="text" name="tip" size="30" value="<%= tip%>"/></td>
                </tr>
                <tr>
                    <td align="right">Numar intrebari:</td>
                    <td> <input type="text" name="nr_intrebari" size="30" value="<%= nr_intrebari%>"/></td>
                </tr>
                
            </table><p align="center">
                <input type="submit" value="Modifica linia">
            </p>
        </form>
        <p align="center"">
            <a class="w3-button w3-border w3-hover-teal w3-button w3-round-xlarge" href="index.html"><b>Home</b></a>
            <br/>
    </body>
</html>
