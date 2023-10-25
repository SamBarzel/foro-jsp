<%@ page import="javax.naming.*"%>
<%@ page import="java.sql.*"%>
<h1>Ejemplo JSP</h1>
<%
out.print("Hola JSP<br>");
String conexion = "jdbc:mysql://127.0.0.1/foro?user=root&password=";
try{
    Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
    Connection con = DriverManager.getConnection(conexion);
    out.print("Conexion exitosa :D");
}catch(SQLException e){
    out.print("Error de conexion 8(|)");
}
%>
