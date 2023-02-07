<%-- 
    Document   : login
    Created on : 4 nov 2022, 16:09:45
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
        <title>Login</title>
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
            Usuario user = null;
            session.removeAttribute("login");
            String correu = request.getParameter("correu");
            String contrasenya = request.getParameter("contrasenya");
            
            if(request.getParameter("send")!=null){
                if(correu.length()!=0 && contrasenya.length()!=0){
                    db.connect();
                    user=db.getUsuario(correu);
                    if(user!=null){
                        if(correu.equals(user.getEmail()) && contrasenya.equals(user.getPassword())){
                            /*String name=request.getParameter("uname");  
                            out.print("Welcome "+name);*/
                            session.setAttribute("login",request.getParameter("correu"));
                            response.sendRedirect("agenda.jsp");
                        }else{
                            out.print("<h1>Usuari i contrasenya incorrectes!</h1>");
                        }
                    }else{
                        out.print("<h1>Usuari no existeix</h1>");
                    }
                }else{
                    out.print("<h1>Indica usuari i contrasenya per a loginar</h1>");
                }
            }
        %>
        <h1>LOGIN</h1>
        <hr/>
        <form action="login.jsp" method="post">  
        Correu:
        <br/><br/>
        <input type="text" name="correu"/><br/><br/>  
        Contrasenya:
        <br/><br/>
        <input type="password" name="contrasenya"/><br/><br/>  
        <input type="submit" value="login" name="send"/>
        </form>
        <hr/>
    </body>
</html>
