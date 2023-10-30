<%@ page import="javax.naming.*"%>
<%@ page import="java.sql.*"%>

<%
String metodo;
String conexion = "jdbc:mysql://127.0.0.1/foro?user=root&password=";
String email, pass;

metodo = request.getMethod();
if(metodo.equalsIgnoreCase("GET")){
    if( (email = request.getParameter("email")) != null &&
    (pass = request.getParameter("pass")) != null ){
        try{
            Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
            Connection con = DriverManager.getConnection(conexion);
            Statement sql = con.createStatement();
            ResultSet user = sql.executeQuery(
                "SELECT * FROM users WHERE email='"+email+"' AND password=sha1('"+pass+"')"
            );
            if(user.next()){
                out.print("{\"email\":\""+user.getString("email")+"\",");
                out.print(" \"name\":\""+user.getString("name")+"\",");
                out.print(" \"avatar\":\""+user.getString("avatar")+"\",");
                out.print(" \"role\":\""+user.getString("role")+"\"}");
            }else{
                out.print("Error de email o contraseña");
            }
        }catch(SQLException e){
                out.print("Error de conexion"+e.toString());
        }
    }
}
%>