<%@page contentType="text/html; ISO-8859-1" pageEncoding="utf-8" %>
<%@page import="java.util.List" %>
<%
    List<String> errores = (List<String>) request.getAttribute("errores");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Formulario de usuarios</title>
</head>
<body>
    <h3>Formulario</h3>
    <%
        if(errores != null && errores.size()>0){


    %>
        <ul>
            <% for (String error : errores ) {%>
                <li><%=error%></li>
            <% } %>
        </ul>
    <%
        }
    %>
    <form action="/webapp-form/form" method="post">
        <div class="">
            <label for="username">Usuario</label>
            <div><input type="text" name="username" id="username"></div>
        </div>
        <div class="password">
            <label for="password">Contraseña</label>
            <div><input type="password" name="password" id="password"></div>
        </div>
        <div class="">
            <label for="email">Correo</label>
            <div><input type="email" name="email" id="email"></div>
        </div>
        <div class="">
            <label for="pais">Pais</label>
            <div class="">
                <select name="pais" id="pais">
                    <option value="">-- Seleccionar --</option>
                    <option value="ES">España</option>
                    <option value="MX">México</option>
                    <option value="CL">Chile</option>
                    <option value="AR">Argentina</option>
                    <option value="PE">Perú</option>
                    <option value="CO">Colombia</option>
                    <option value="VE">Venezuela</option>
                </select>
            </div>
        </div>
        <div class="">
            <label for="lenguajes">Lenguajes de programación</label>
            <div class="">
                <select name="lenguajes" id="lenguajes" multiple>
                    <option value="java">Java SE</option>
                    <option value="jakartaee">Jakarta EE9</option>
                    <option value="spring">Spring Boot</option>
                    <option value="js">Javascript</option>
                    <option value="angular">Angular</option>
                    <option value="react">React</option>
                </select>
            </div>
        </div>
        <div class="">
            <label>Roles</label>
            <div class="">
                <input type="checkbox" name="roles" value="ROLE_ADMIN">
                <label>Administrador</label>
            </div>
        </div>
        <div class="">
            <input type="checkbox" name="roles" value="ROLE_USER">
            <label>Usuario</label>
        </div>
        <div class="">
            <input type="checkbox" name="roles" value="ROLE_MODERATOR">
            <label>Moderador</label>
        </div>
        <div class="">
            <label>Idiomas</label>
            <div>
                <input type="radio" name="idioma" value="es">
                <label>Español</label>
            </div>
            <div>
                <input type="radio" name="idioma" value="en">
                <label>Inglés</label>
            </div>
            <div>
                <input type="radio" name="idioma" value="fr">
                <label>Francés</label>
            </div>
            <div class="">
                <label for="habilitar">Habilitar</label>
                <div class="">
                    <input type="checkbox" name="habilitar" id="habilitar" checked>
                </div>
            </div>
        </div>
        <div class="">
            <div class="">
                <input type="submit" value="Enviar">
            </div>
        </div>
        <input type="hidden" name="secreto" value="12345">
    </form>
</body>
</html>