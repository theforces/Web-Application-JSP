<%-- 
    Document   : nou_Student
    Created on : Dec 27, 2018, 9:08:17 PM
    Author     : Andrei
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="javax.*,java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <title>Adauga student</title>
    </head>
    <jsp:useBean id="jb" scope="session" class="db.JavaBean" />
    <jsp:setProperty name="jb" property="*" />
    <body style="background-color: black;color: white">
        <%
            String nume = request.getParameter("nume");
            String prenume = request.getParameter("prenume");
            String grupa = request.getParameter("grupa");
            if (nume != null) {
                jb.connect();
                jb.adaugaStudenti(nume, prenume, grupa);
                jb.disconnect();
        %>
        <p>Datele au fost adaugate.</p><%
        } else {
        %>
        <h1> Suntem in tabela Studenti.</h1>
        <form action="nou_Student.jsp" method="post">
            <table>
                <tr class="w3-panel w3-border w3-border-red w3-hover-border-green">
                    <td class="w3-panel w3-leftbar w3-border-blue w3-pale-blue" align="center">Nume Student:</td>
                    <td> <input type="text" name="nume" size="40" /></td>
                </tr>
                <tr class="w3-panel w3-border w3-border-red w3-hover-border-green">
                    <td class="w3-panel w3-leftbar w3-border-blue w3-pale-blue" align="center">Prenume Student:</td>
                    <td> <input type="text" name="prenume" size="40" /></td>
                </tr>
                <tr class="w3-panel w3-border w3-border-red w3-hover-border-green">
                    <td class="w3-panel w3-leftbar w3-border-blue w3-pale-blue" align="center">Grupa:</td>
                    <td> <input type="text" name="grupa" size="40" /></td>
                </tr>
            </table>
            <input type="submit" value="Adauga studentul" />
        </form>
        <%
            }
        %>
        <br/>
        <a class="w3-button w3-border w3-hover-teal w3-button w3-round-xlarge" href="index.html"><b>Home</b></a>
        <br/>
    </body>
</html>