<%-- 
    Document   : m1_Disciplina
    Created on : Dec 27, 2018, 9:19:10 PM
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
        <title>Tabela Disciplina</title>
        <link href="table.css" rel="stylesheet" type="text/css" media="screen" />
    </head>
    <jsp:useBean id="jb" scope="session" class="db.JavaBean" />
    <jsp:setProperty name="jb" property="*" />
    <body style="background-color: black;color: white">
        <h1 align="center">Tabela Disciplina:</h1>
        <br/>
        <p class="w3-button w3-black w3-round-xlarge" align="center"><a href="nou_Disciplina.jsp"><b>Adauga o noua disciplina.</b></a> <a class="w3-button w3-border w3-hover-teal w3-button w3-round-xlarge" href="index.html"><b>Home</b></a></p>
        <%
            jb.connect();
            String NumeStudent, PrenumeStudent, Grupa, Tip,Nr_intrebari, DataExamen, PuncteCredit;

            int aux = java.lang.Integer.parseInt(request.getParameter("primarykey"));
            ResultSet rs = jb.intoarceDisciplinaId(aux);
            rs.first();
            int id1 = rs.getInt("studenti_idstudenti");
            int id2 = rs.getInt("subiecte_idsubiecte");

            NumeStudent = rs.getString("nume");
            PrenumeStudent = rs.getString("prenume");
            Grupa = rs.getString("grupa");
            Tip = rs.getString("tip");
            Nr_intrebari = rs.getString("nr_intrebari");
            DataExamen = rs.getString("dataExamen");
            PuncteCredit = rs.getString("puncteCredit");
            

            ResultSet rs1 = jb.vedeTabela("studenti");
            ResultSet rs2 = jb.vedeTabela("subiecte");
            int idstudenti, idsubiecte;


        %>
        <form action="m2_Disciplina.jsp" method="post">
            <table align="center">
                <tr>
                    <td align="right">Id Disciplina:</td>
                    <td> <input type="text" name="idDisciplina" size="30" value="<%= aux%>" readonly/></td>
                </tr>
                <tr>
                    <td align="right">Id Student:</td>
                    <td> 
                        <SELECT NAME="idstudenti">
                            <%
                                while (rs1.next()) {
                                    idstudenti = rs1.getInt("idstudenti");
                                    NumeStudent = rs1.getString("nume");
                                    PrenumeStudent = rs1.getString("prenume");
                                    Grupa = rs1.getString("grupa");
                                    if (idstudenti != id1) {
                            %>
                            <OPTION VALUE="<%= idstudenti%>"><%= idstudenti%>, <%= NumeStudent%>, <%= PrenumeStudent%>, <%= Grupa%></OPTION>
                                <%
                                        } else {
                                %>                
                            <OPTION selected="yes" VALUE="<%= idstudenti%>"><%= idstudenti%>, <%= NumeStudent%>, <%= PrenumeStudent%>, <%= Grupa%></OPTION>
                                <%
                                        }
                                    }
                                %>
                        </SELECT>

                    </td>
                </tr>
                <tr>
                    <td align="right">Id Subiect:</td>
                    <td> 
                        <SELECT NAME="idsubiecte">
                            <%
                                while (rs2.next()) {
                                    idsubiecte = rs2.getInt("idsubiecte");
                                    Tip = rs2.getString("tip");
                                    Nr_intrebari = rs2.getString("nr_intrebari");
                                    
                            if (idsubiecte != id2) {
                            %>
                            <OPTION VALUE="<%= idsubiecte%>"><%= idsubiecte%>, <%= Tip%>, <%= Nr_intrebari%></OPTION>
                                <%
                                        } else {
                                %>                
                            <OPTION selected="yes" VALUE="<%= idsubiecte%>"><%= idsubiecte%>, <%= Tip%>, <%= Nr_intrebari%></OPTION>
                                <%
                                        }
                                    }
                                %>
                        </SELECT>

                    </td>
                </tr>
                <tr>
                    <td align="right">DataExamen:</td>
                    <td> <input type="text" name="dataExamen" size="30" value="<%= DataExamen%>"/></td>
                </tr>
                <tr>
                    <td align="right">PuncteCredit:</td>
                    <td> <input type="text" name="puncteCredit" size="30" value="<%= PuncteCredit%>"/></td>
                </tr>
            </table><p align="center">
                <input type="submit" value="Modifica linia">
            </p>
        </form>
        <p align="center"">
            <a class="w3-button w3-border w3-hover-teal w3-button w3-round-xlarge" href="index.html"><b>Home</b></a>
            <br/>
    </body>
    <%
        rs.close();
        rs1.close();
        rs2.close();
        jb.disconnect();
    %>
</html>
