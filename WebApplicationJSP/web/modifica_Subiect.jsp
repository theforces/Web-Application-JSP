<%-- 
    Document   : modifica_Subiect
    Created on : Dec 27, 2018, 9:14:00 PM
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
    </head>
    <jsp:useBean id="jb" scope="session" class="db.JavaBean" />
    <jsp:setProperty name="jb" property="*" />
    <body style="background-color: black;color: white" class="w3-container w3-center">
        <h1 class="w3-panel w3-topbar w3-bottombar w3-border-red w3-pale-red" align="center"> Tabela Subiecte:</h1>
        <br/>
        <p align="center" class="w3-button w3-black w3-round-xlarge"><a href="nou_Subiect.jsp"><b>Adauga un nou subiect.</b></a> <a class="w3-button w3-border w3-hover-teal w3-button w3-round-xlarge" href="index.html"><b>Home</b></a></p>
        <form action="m1_Subiect.jsp" method="post">
            <table border="1" align="center">
                <tr>
                    <td><b>Mark:</b></td>
                    <td><b>IdSubiect:</b></td>
                    <td><b>Tip:</b></td>
                    <td><b>Numar intrebari:</b></td>
                   
                </tr>
                <%
                    jb.connect();
                    ResultSet rs = jb.vedeTabela("subiecte");
                    long x;
                    while (rs.next()) {
                        x = rs.getLong("idsubiecte");
                %>
                <tr>
                    <td><input type="checkbox" name="primarykey" value="<%= x%>" /></td>
                    <td><%= x%></td>
                    <td><%= rs.getString("tip")%></td>
                    <td><%= rs.getString("nr_intrebari")%></td>
                    
                    <%
                        }
                    %>
                </tr>
            </table><br/>
            <p align="center">
                <input type="submit" value="Modifica linia">
            </p>
        </form>
        <%
    jb.disconnect();%>
        <br/>
        <p align="center">
            <a class="w3-button w3-border w3-hover-teal w3-button w3-round-xlarge" href="index.html"><b>Home</b></a>
            <br/>
        </p>
    </body>
</html>

