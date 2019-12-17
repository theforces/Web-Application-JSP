<%-- 
    Document   : nou_Subiect
    Created on : Dec 27, 2018, 9:12:42 PM
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
        <title>Adauga Subiect</title>
    </head>
    <jsp:useBean id="jb" scope="session" class="db.JavaBean" />
    <jsp:setProperty name="jb" property="*" />
    <body style="background-color: black; color: white">
        <%
            String tip = request.getParameter("tip");
            String nr_intrebari = request.getParameter("nr_intrebari");
            
            if (tip != null) {
                jb.connect();
                jb.adaugaSubiecte(tip, nr_intrebari);
                jb.disconnect();
        %>
        <p>Datele au fost adaugate.</p><%
        } else {
        %>
        <h1> Suntem in tabela Subiecte.</h1>
        <form action="nou_Subiect.jsp" method="post">
            
            <table>
                <tr class="w3-panel w3-border w3-border-red w3-hover-border-green">
                    <td class="w3-panel w3-leftbar w3-border-blue w3-pale-blue" align="center">Tip subiect</td>
                    <td> <input type="text" name="tip" size="40" /></td>
                </tr>
                <tr class="w3-panel w3-border w3-border-red w3-hover-border-green">
                    <td class="w3-panel w3-leftbar w3-border-blue w3-pale-blue" align="center">Numar intrebari:</td>
                    <td> <input type="text" name="nr_intrebari" size="40" /></td>
                </tr>
                
            </table>
            <input type="submit" value="Adauga subiectul" />
        </form>
        <%
            }
        %>
        <br/>
        <a class="w3-button w3-border w3-hover-teal w3-button w3-round-xlarge" href="index.html"><b>Home</b></a>
        <br/>
    </body>
</html>
