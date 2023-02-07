<%-- 
    Document   : prova
    Created on : 30 ene 2023, 16:15:56
    Author     : Edu Thomas
--%>

<%@page import="java.util.List"%>
<%@page import="paquet.Usuario"%>
<%@page import="paquet.DBManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            DBManager db = new DBManager();
            Usuario user = new Usuario();
            session.removeAttribute("login");
            String mail = request.getParameter("correu");
            String pass = request.getParameter("contrasenya");
            Boolean insertat = false;
            
            if(!insertat) {
                out.print("Llavors insertar");
            }
            
            out.print(mail + " " + pass);
            out.print("fora");
            
            if(request.getParameter("send")!=null){
//                db.connect();
//                user = db.getUsuario(mail);
//                
//                out.print(user.getPassword());
//                out.print("dins");
//                
//                if(mail.equals(user.getEmail()) && pass.equals(user.getPassword())){
//                    out.print("<h1>Usuari correcte</h1>");
//                }else{
//                    out.print("<h1>Usuari i contrasenya incorrectes!</h1>");
//                }
//                
//                //out.print(user.getEmail());
            }
        %>
        <form action="prova.jsp" method="post">  
        Correu:
        <input type="text" name="correu"/><br/><br/> 
        Contrasenya:
        <input type="password" name="contrasenya"/><br/><br/>  
        <input type="submit" value="login" name="send"/>  
        </form>
    </body>
</html>
