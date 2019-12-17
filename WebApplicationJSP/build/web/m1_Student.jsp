<%-- 
    Document   : m1_Student
    Created on : Dec 27, 2018, 9:10:35 PM
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
        <title>Tabela Studenti</title>
        <link href="table.css" rel="stylesheet" type="text/css" media="screen" />
    </head>
    <jsp:useBean id="jb" scope="session" class="db.JavaBean" />
    <jsp:setProperty name="jb" property="*" />
    <body style="background-color: black;color: white">
        <h1 align="center">Tabela Studenti:</h1>
        <br/>
        <p class="w3-button w3-black w3-round-xlarge" align="center"><a href="nou_Student.jsp"><b>Adauga un nou student.</b></a> <a class="w3-button w3-border w3-hover-teal w3-button w3-round-xlarge" href="index.html"><b>Home</b></a></p>
        <%
            jb.connect();
            int aux = java.lang.Integer.parseInt(request.getParameter("primarykey"));
            ResultSet rs = jb.intoarceLinieDupaId("studenti", "idstudenti", aux);
            rs.first();
            String nume = rs.getString("nume");
            String prenume = rs.getString("prenume");
            String grupa = rs.getString("grupa");
            rs.close();
            jb.disconnect();
        %>
        <form action="m2_Student.jsp" method="post">
            <table align="center">
                <tr>
                    <td align="right">IdStudent:</td>
                    <td> <input type="text" name="idstudenti" size="30" value="<%= aux%>" readonly/></td>
                </tr>
                <tr>
                    <td align="right">Nume:</td>
                    <td> <input type="text" name="nume" size="30" value="<%= nume%>"/></td>
                </tr>
                <tr>
                    <td align="right">Prenume:</td>
                    <td> <input type="text" name="prenume" size="30" value="<%= prenume%>"/></td>
                </tr>
                <tr>
                    <td align="right">Grupa:</td>
                    <td> <input type="text" name="grupa" size="30" value="<%= grupa%>"/></td>
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