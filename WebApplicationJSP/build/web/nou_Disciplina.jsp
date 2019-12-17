<%-- 
    Document   : nou_Disciplina
    Created on : Dec 27, 2018, 9:16:57 PM
    Author     : Andrei
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="javax.*, java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <title>Adauga disciplina</title>
    </head>
    <jsp:useBean id="jb" scope="session" class="db.JavaBean" />
    <jsp:setProperty name="jb" property="*" />
    <body style="background-color: black; color: white">
        <%
            int idstudenti , idsubiecte;
            String puncteCredit;
            String id1, id2,id3, numeStudent, prenumeStudent, grupa, Tip, nr_intrebari, dataExamen;
           // id1 = request.getParameter("idDisciplina");
            id2 = request.getParameter("idstudent");
            id3 = request.getParameter("idsubiecte");
            dataExamen = request.getParameter("dataExamen");
            puncteCredit = request.getParameter("puncteCredit");
           
            if (id2 != null) {
                jb.connect();
                jb.adaugaDisciplina(java.lang.Integer.parseInt(id2), dataExamen, java.lang.Integer.parseInt(puncteCredit), java.lang.Integer.parseInt(id3));
                jb.disconnect();
        %>
        <p>Datele au fost adaugate.</p><%
        } else {
        jb.connect();
        ResultSet rs1 = jb.vedeTabela("studenti");
        ResultSet rs2 = jb.vedeTabela("subiecte");
        %>
        <h1> Suntem in tabela Disciplina.</h1>
        <form action="nou_Disciplina.jsp" method="post">
            <table>
                <tr class="w3-panel w3-border w3-border-red w3-hover-border-green">
                    <td class="w3-panel w3-leftbar w3-border-blue w3-pale-blue" align="right">IdStudent:</td>
                    <td> 
                        Selectati studentul:
			<SELECT NAME="idstudent">
                                <%
                                    while(rs1.next()){
                                        idstudenti = rs1.getInt("idstudenti");
                                        numeStudent = rs1.getString("nume");
                                        prenumeStudent = rs1.getString("prenume");
                                        grupa = rs1.getString("grupa");
                                %>
                                    <OPTION VALUE="<%= idstudenti%>"><%= idstudenti%>,<%= numeStudent%>,<%= prenumeStudent%>,<%= grupa%></OPTION>
                                <%
                                    }
                                %>
			</SELECT>
                    
                    </td>
                </tr>
                <tr class="w3-panel w3-border w3-border-red w3-hover-border-green">
                    <td class="w3-panel w3-leftbar w3-border-blue w3-pale-blue" align="right">IdSubiecte:</td>
                    <td> 
                        Selectati subiectul:
			<SELECT NAME="idsubiecte">
				<!-- OPTION selected="yes" VALUE="iris1">Iris 1</OPTION -->
                                <%
                                    while(rs2.next()){
                                        idsubiecte = rs2.getInt("idsubiecte");
                                        Tip = rs2.getString("tip");
                                        nr_intrebari = rs2.getString("nr_intrebari");
                                       
                                %>
                                    <OPTION VALUE="<%= idsubiecte%>"><%= idsubiecte%>,<%= Tip%>,<%= nr_intrebari%></OPTION>
                                <%
                                    }
                                %>
			</SELECT>
                     </td>
                </tr>
                <tr class="w3-panel w3-border w3-border-red w3-hover-border-green">
                    <td class="w3-panel w3-leftbar w3-border-blue w3-pale-blue" align="right">Data Examen:</td>
                    <td> <input type="text" name="dataExamen" size="30" /></td>
                </tr>
                <tr class="w3-panel w3-border w3-border-red w3-hover-border-green">
                    <td class="w3-panel w3-leftbar w3-border-blue w3-pale-blue" align="right">Puncte de Credit:</td>
                    <td> <input type="text" name="puncteCredit" size="30" /></td>
                </tr>
            </table>
            <input type="submit" value="Adauga Disciplina" />
        </form>
        <%
            }
        %>
        <br/>
        <a class="w3-button w3-border w3-hover-teal w3-button w3-round-xlarge" href="index.html"><b>Home</b></a>
        <br/>
    </body>
</html>
