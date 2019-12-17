/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package db;

import java.sql.*;

/**
 *
 * @author Andrei
 */
public class JavaBean {

    String error;
    Connection con;

    public JavaBean() {
    }

    public void connect() throws ClassNotFoundException, SQLException, Exception {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/PAI?useSSL=false", "root", "Tf131196ma"); // nu uitati sa puneti parola corecta de root pe care o aveti setata pe serverul vostru de MySql.
        } catch (ClassNotFoundException cnfe) {
            error = "ClassNotFoundException: Nu s-a gasit driverul bazei de date.";
            throw new ClassNotFoundException(error);
        } catch (SQLException cnfe) {
            error = "SQLException: Nu se poate conecta la baza de date.";
            throw new SQLException(error);
        } catch (Exception e) {
            error = "Exception: A aparut o exceptie neprevazuta in timp ce se stabilea legatura la baza de date.";
            throw new Exception(error);
        }
    } // connect()

    public void connect(String bd) throws ClassNotFoundException, SQLException, Exception {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/" + bd, "root", "genius97");
        } catch (ClassNotFoundException cnfe) {
            error = "ClassNotFoundException: Nu s-a gasit driverul bazei de date.";
            throw new ClassNotFoundException(error);
        } catch (SQLException cnfe) {
            error = "SQLException: Nu se poate conecta la baza de date.";
            throw new SQLException(error);
        } catch (Exception e) {
            error = "Exception: A aparut o exceptie neprevazuta in timp ce se stabilea legatura la baza de date.";
            throw new Exception(error);
        }
    } // connect(String bd)

    public void connect(String bd, String ip) throws ClassNotFoundException, SQLException, Exception {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://" + ip + ":3306/" + bd, "root", "parola");
        } catch (ClassNotFoundException cnfe) {
            error = "ClassNotFoundException: Nu s-a gasit driverul bazei de date.";
            throw new ClassNotFoundException(error);
        } catch (SQLException cnfe) {
            error = "SQLException: Nu se poate conecta la baza de date.";
            throw new SQLException(error);
        } catch (Exception e) {
            error = "Exception: A aparut o exceptie neprevazuta in timp ce se stabilea legatura la baza de date.";
            throw new Exception(error);
        }
    } // connect(String bd, String ip)

    public void disconnect() throws SQLException {
        try {
            if (con != null) {
                con.close();
            }
        } catch (SQLException sqle) {
            error = ("SQLException: Nu se poate inchide conexiunea la baza de date.");
            throw new SQLException(error);
        }
    } // disconnect()

    public void adaugaStudenti(String nume, String prenume, String grupa)
            throws SQLException, Exception {
        if (con != null) {
            try {
// create a prepared SQL statement
                Statement stmt;
                stmt = con.createStatement();
                stmt.executeUpdate("insert into studenti(nume, prenume, grupa) values('" + nume + "'  , '" + prenume + "', '" + grupa + "');");

            } catch (SQLException sqle) {
                error = "ExceptieSQL: Reactualizare nereusita; este posibil sa existe duplicate.";
                throw new SQLException(error);
            }
        } else {
            error = "Exceptie: Conexiunea cu baza de date a fost pierduta.";
            throw new Exception(error);
        }
    } // end of adaugaStudenti()

    public void adaugaSubiecte(String tip, String nr_intrebari)
            throws SQLException, Exception {
        if (con != null) {
            try {
// create a prepared SQL statement
                Statement stmt;
                stmt = (Statement) con.createStatement();
                stmt.executeUpdate("insert into subiecte(tip, nr_intrebari) values('" + tip + "'  , '" + nr_intrebari + "');");

            } catch (SQLException sqle) {
                error = "ExceptieSQL: Reactualizare nereusita; este posibil sa existe duplicate.";
                throw new SQLException(error);
            }
        } else {
            error = "Exceptie: Conexiunea cu baza de date a fost pierduta.";
            throw new Exception(error);
        }
    } // end of adaugaSubiecte()

    public void adaugaDisciplina(int studenti_idstudenti, String dataExamen, int puncteCredit, int subiecte_idsubiecte)
            throws SQLException, Exception {
        if (con != null) {
            try {
// create a prepared SQL statement
                Statement stmt;
                stmt = con.createStatement();
                stmt.executeUpdate("insert into Disciplina(studenti_idstudenti, dataExamen, puncteCredit, subiecte_idsubiecte) values('" + studenti_idstudenti + "', '" + dataExamen + "', '" + puncteCredit + "', '" + subiecte_idsubiecte + "');");
                // se poate modifica valoarea datei astfel incat sa se ia data curenta a sistemului:
                // stmt.executeUpdate("insert into consultatie(idpacient, idmedic, DataConsultatie, Diagnostic, Medicament) values('" + idpacient + "'  , '" + idmedic + "', CURDATE(), '" + Diagnostic + "', '" + Medicament + "');");

            } catch (SQLException sqle) {
                error = "ExceptieSQL: Reactualizare nereusita; este posibil sa existe duplicate.";
                throw new SQLException(error);
            }
        } else {
            error = "Exceptie: Conexiunea cu baza de date a fost pierduta.";
            throw new Exception(error);
        }
    } // end of adaugaDisciplina()

    public ResultSet vedeTabela(String tabel) throws SQLException, Exception {
        ResultSet rs = null;
        try {
            String queryString = ("SELECT * FROM `PAI`.`" + tabel + "`;");
            Statement stmt = con.createStatement(/*ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY*/);
            rs = stmt.executeQuery(queryString);
        } catch (SQLException sqle) {
            error = "SQLException: Interogarea nu a fost posibila.";
            throw new SQLException(error);
        } catch (Exception e) {
            error = "A aparut o exceptie in timp ce se extrageau datele.";
            throw new Exception(error);
        }
        return rs;
    } // vedeTabela()

    public ResultSet vedeDisciplina() throws SQLException, Exception {
        ResultSet rs = null;
        try {
            String queryString = ("SELECT a.nume, a.prenume , a.grupa, b.tip, b.nr_intrebari, c.idDisciplina, c.subiecte_idsubiecte, c.studenti_idstudenti, c.dataExamen , c.puncteCredit FROM studenti a, subiecte b, Disciplina c WHERE a.idstudenti = c.studenti_idstudenti AND b.idsubiecte = c.subiecte_idsubiecte;");
            Statement stmt = (Statement) con.createStatement(/*ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY*/);
            rs = stmt.executeQuery(queryString);
        } catch (SQLException sqle) {
            error = "SQLException: Interogarea nu a fost posibila.";
            throw new SQLException(error);
        } catch (Exception e) {
            error = "A aparut o exceptie in timp ce se extrageau datele.";
            throw new Exception(error);
        }
        return rs;
    } // vedeDisciplina()

    public void stergeDateTabela(String[] primaryKeys, String tabela, String dupaID) throws SQLException, Exception {
        if (con != null) {
            try {
// create a prepared SQL statement
                long aux;
                PreparedStatement delete;
                delete = con.prepareStatement("DELETE FROM " + tabela + " WHERE " + dupaID + "=?;");
                for (int i = 0; i < primaryKeys.length; i++) {
                    aux = java.lang.Long.parseLong(primaryKeys[i]);
                    delete.setLong(1, aux);
                    delete.execute();
                }
            } catch (SQLException sqle) {
                error = "ExceptieSQL: Reactualizare nereusita; este posibil sa existe duplicate.";
                throw new SQLException(error);
            } catch (Exception e) {
                error = "A aparut o exceptie in timp ce erau sterse inregistrarile.";
                throw new Exception(error);
            }
        } else {
            error = "Exceptie: Conexiunea cu baza de date a fost pierduta.";
            throw new Exception(error);
        }
    } // end of stergeDateTabela()

    public void stergeTabela(String tabela) throws SQLException, Exception {
        if (con != null) {
            try {
// create a prepared SQL statement
                Statement stmt;
                stmt = con.createStatement();
                stmt.executeUpdate("DELETE FROM " + tabela + ";");
            } catch (SQLException sqle) {
                error = "ExceptieSQL: Stergere nereusita; este posibil sa existe duplicate.";
                throw new SQLException(error);
            }
        } else {
            error = "Exceptie: Conexiunea cu baza de date a fost pierduta.";
            throw new Exception(error);
        }
    } // end of stergeTabela()

    public void modificaTabela(String tabela, String IDTabela, int ID, String[] campuri, String[] valori) throws SQLException, Exception {
        String update = "UPDATE " + tabela + " SET ";
        String temp = "";
        if (con != null) {
            try {
                for (int i = 0; i < campuri.length; i++) {
                    if (i != (campuri.length - 1)) {
                        temp = temp + campuri[i] + "='" + valori[i] + "', ";
                    } else {
                        temp = temp + campuri[i] + "='" + valori[i] + "' WHERE " + IDTabela + " = '" + ID + "';";
                    }
                }
                update = update + temp;
// create a prepared SQL statement
                Statement stmt;
                stmt = con.createStatement();
                stmt.executeUpdate(update);
            } catch (SQLException sqle) {
                error = "ExceptieSQL: Reactualizare nereusita; este posibil sa existe duplicate.";
                throw new SQLException(error);
            }
        } else {
            error = "Exceptie: Conexiunea cu baza de date a fost pierduta.";
            throw new Exception(error);
        }
    } // end of modificaTabela()

    public ResultSet intoarceLinie(String tabela, int ID) throws SQLException, Exception {
        ResultSet rs = null;
        try {
// Execute query
            String queryString = ("SELECT * FROM " + tabela + " WHERE idstudenti=" + ID + ";");
            Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            rs = stmt.executeQuery(queryString); //sql exception
        } catch (SQLException sqle) {
            error = "SQLException: Interogarea nu a fost posibila.";
            throw new SQLException(error);
        } catch (Exception e) {
            error = "A aparut o exceptie in timp ce se extrageau datele.";
            throw new Exception(error);
        }
        return rs;
    } // end of intoarceLinie()

    public ResultSet intoarceLinieDupaId(String tabela, String denumireId, int ID) throws SQLException, Exception {
        ResultSet rs = null;
        try {
// Execute query
            String queryString = ("SELECT * FROM " + tabela + " WHERE " + denumireId + "=" + ID + ";");
            Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            rs = stmt.executeQuery(queryString); //sql exception
        } catch (SQLException sqle) {
            error = "SQLException: Interogarea nu a fost posibila.";
            throw new SQLException(error);
        } catch (Exception e) {
            error = "A aparut o exceptie in timp ce se extrageau datele.";
            throw new Exception(error);
        }
        return rs;
    } // end of intoarceLinieDupaId()

    public ResultSet intoarceDisciplinaId(int ID) throws SQLException, Exception {
        ResultSet rs = null;
        try {
// Execute query
            String queryString = ("SELECT a.nume, a.prenume, a.grupa, b.tip, b.nr_intrebari, c.idDisciplina, c.subiecte_idsubiecte, c.studenti_idstudenti, c.dataExamen, c.puncteCredit FROM studenti a, subiecte b, Disciplina c WHERE a.idstudenti = c.studenti_idstudenti AND b.idsubiecte = c.subiecte_idsubiecte AND idDisciplina = '" + ID + "';");
            Statement stmt = (Statement) con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            rs = stmt.executeQuery(queryString); //sql exception
        } catch (SQLException sqle) {
            error = "SQLException: Interogarea nu a fost posibila.";
            throw new SQLException(error);
        } catch (Exception e) {
            error = "A aparut o exceptie in timp ce se extrageau datele.";
            throw new Exception(error);
        }
        return rs;
    } // end of intoarceLinieDupaId()
}
