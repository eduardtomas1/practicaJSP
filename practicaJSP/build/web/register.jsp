<%-- 
    Document   : register
    Created on : 6 feb 2023, 16:21:44
    Author     : Edu Thomas
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="paquet.Usuario"%>
<%@page import="paquet.DBManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register</title>
        <style>
            body
            {
                text-align: center;
                font-size: 25px;
            }
        </style>
    </head>
    <body>
        
        <%
            DBManager db = new DBManager();
            Usuario user = new Usuario();
            session.removeAttribute("login");
            String correu = request.getParameter("correu");
            String contrasenya = request.getParameter("contrasenya");
            Boolean insertat = false;
            
            db.connect();
            List<Usuario> usuarios = db.getUsuarios();
            
            for (Usuario usu : usuarios) {
                if(usu.getEmail() == correu){
                    insertat = true;
                }
            }
            
            if(request.getParameter("send")!=null){
                if(correu.length()!=0 && contrasenya.length()!=0){
                    if(!insertat){
                        user.setEmail(correu);
                        user.setPassword(contrasenya);

                        if(db.insertUsuario(user)){
                            out.print("<h1>Insertat!</h1>");
                        } else {
                            out.print("<h1>Error!</h1>");
                        }
                    }
                } else {
                    out.print("<h1>Introdueix dades!</h1>");
                }
            }
        %>
        
        <h1>Register</h1>
        <hr/>
        <form action="register.jsp" method="post">  
        Correu:
        <br/><br/>
        <input type="text" name="correu"/><br/><br/>  
        Contrasenya:
        <br/><br/>
        <input type="password" name="contrasenya"/><br/><br/>  
        <input type="submit" value="register" name="send"/>
        </form>
        <hr/>
    </body>
</html>
