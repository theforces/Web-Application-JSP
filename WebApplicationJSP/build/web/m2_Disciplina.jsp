<%-- 
    Document   : m2_Disciplina
    Created on : Dec 27, 2018, 9:19:51 PM
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
        <title>Tabela Disciplina</title>
        <link href="table.css" rel="stylesheet" type="text/css" media="screen" />
    </head>
    <jsp:useBean id="jb" scope="session" class="db.JavaBean" />
    <jsp:setProperty name="jb" property="*" />
    <body style="background-color: black;color: white">
        <h1 align="center"> Tabela Disciplina:</h1>
        <br/>
        <p class="w3-button w3-black w3-round-xlarge" align="center"><a href="nou_Disciplina.jsp"><b>Adauga o noua disciplina.</b></a> <a class="w3-button w3-border w3-hover-teal w3-button w3-round-xlarge" href="index.html"><b>Home</b></a></p>
        <%
            jb.connect();
            int aux = java.lang.Integer.parseInt(request.getParameter("idDisciplina"));
            String idstudenti = request.getParameter("idstudenti");
            String idsubiecte = request.getParameter("idsubiecte");
            String DataExamen = request.getParameter("dataExamen");
            String puncteCredit = request.getParameter("puncteCredit");
            

            String[] valori = {idstudenti, idsubiecte, DataExamen, puncteCredit};
            String[] campuri = {"studenti_idstudenti", "subiecte_idsubiecte", "dataExamen", "puncteCredit"};
            jb.modificaTabela("Disciplina", "idDisciplina", aux, campuri, valori);
            jb.disconnect();
        %>
        <h1 align="center">Modificarile au fost efectuate !</h1>
        <p align="center">
            <a class="w3-button w3-border w3-hover-teal w3-button w3-round-xlarge" href="index.html"><b>Home</b></a>
            <br/>
    </body>
</html>