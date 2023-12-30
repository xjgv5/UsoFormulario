<%@page contentType="text/html; ISO-8859-1" pageEncoding="utf-8" %>
<%@page import="java.util.List" %>
<%@page import="java.util.Map" %>
<%
    Map<String, String> errores = (Map<String, String>) request.getAttribute("errores");

%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Formulario de usuarios</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
</head>
<body>
<div class="container">
    <h3>Formulario</h3>
    <%
        if (errores != null && errores.size() > 0) {
    %>
    <ul class="alert alert-danger my-5">
        <% for (String error : errores.values()) {%>
        <li><%=error%>
        </li>
        <% } %>
    </ul>
    <%
        }
    %>
    <form action="/webapp-form/form" method="post">
        <div class="row mb-3">
            <label for="username" class="col-form-control col-sm-2">Usuario</label>
            <div class="col-sm-4"><input type="text" name="username" id="username" class="form-control"></div>
            <%
                if (errores != null && errores.containsKey("username")) {
                    out.println("<small class='alert alert-danger' style='color: red;'>" + errores.get("username") + "</small>");
                }
            %>
        </div>
        <div class="row mb-3">
            <label for="password" class="col-form-control col-sm-2">Contraseña</label>
            <div class="col-sm-4"><input type="password" name="password" id="password" class="form-control"></div>
            <%
                if (errores != null && errores.containsKey("password")) {
                    out.println("<small class='alert alert-danger' style='color: red;'>" + errores.get("password") + "</small>");
                }
            %>
        </div>
        <div class="row mb-3" class="col-form-control">
            <label for="email" class="col-form-control col-sm-2">Correo</label>
            <div class="col-sm-4"><input type="email" name="email" id="email" class="form-control"></div>
            <%
                if (errores != null && errores.containsKey("email")) {
                    out.println("<small class='alert alert-danger' style='color: red;'>" + errores.get("email") + "</small>");
                }
            %>
        </div>
        <div class="row mb-3">
            <label for="pais" class="col-form-control col-sm-2">Pais</label>
            <div class="col-sm-4">
                <select name="pais" id="pais" class="form-select">
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
            <%
                if (errores != null && errores.containsKey("pais")) {
                    out.println("<small class='alert alert-danger' style='color: red;'>" + errores.get("pais") + "</small>");
                }
            %>
        </div>
        <div class="row mb-3">
            <label for="lenguajes" class="col-form-control col-sm-2">Lenguajes de programación</label>
            <div class="col-sm-4">
                <select name="lenguajes" id="lenguajes" multiple class="form-select">
                    <option value="java">Java SE</option>
                    <option value="jakartaee">Jakarta EE9</option>
                    <option value="spring">Spring Boot</option>
                    <option value="js">Javascript</option>
                    <option value="angular">Angular</option>
                    <option value="react">React</option>
                </select>
            </div>
            <%
                if (errores != null && errores.containsKey("lenguajes")) {
                    out.println("<small class='alert alert-danger' style='color: red;'>" + errores.get("lenguajes") + "</small>");
                }
            %>
        </div>
        <div class="row-mb-3"> <!-- Roles -->
            <label class="col-form-label col-sm-2">Roles</label>
            <div class="form-check col-sm-2">
                <input type="checkbox" name="roles" value="ROLE_ADMIN" class="form-check-input">
                <label class="form-check-label">Administrador</label>
            </div>

            <div class="form-check col-sm-2">
                <input type="checkbox" name="roles" value="ROLE_USER" class="form-check-input">
                <label class="form-check-label">Usuario</label>
            </div>
            
            <div class="form-check col-sm-2">
                <input type="checkbox" name="roles" value="ROLE_MODERATOR" class="form-check-input">
                <label class="form-check-label">Moderador</label>
            </div>
            <%
                if (errores != null && errores.containsKey("roles")) {
                    out.println("<small class='alert alert-danger' style='color: red;'>" + errores.get("roles") + "</small>");
                }
            %>
        </div>
        <div class="row mb-3">
            <label class="col-form-control col-sm-2">Idiomas</label>
            <div class="form-check col-sm-2">
                <input type="radio" name="idioma" value="es">
                <label>Español</label>
            </div>
            <div class="form-check col-sm-2">
                <input type="radio" name="idioma" value="en">
                <label>Inglés</label>
            </div>
            <div class="form-check col-sm-2">
                <input type="radio" name="idioma" value="fr">
                <label>Francés</label>
            </div>
            <%
                if (errores != null && errores.containsKey("idioma")) {
                    out.println("<small class='alert alert-danger' style='color: red;'>" + errores.get("idioma") + "</small>");
                }
            %>
            <div class="form-check">
                <label for="habilitar" class="col-form-control col-sm-2">Habilitar</label>
                <div class="form-check col-sm-2">
                    <input type="checkbox" name="habilitar" id="habilitar" checked>
                </div>
            </div>
        </div>
        <div class="">
            <div class="">
                <input type="submit" value="Enviar" class="btn btn-primary">
            </div>
        </div>
        <input type="hidden" name="secreto" value="12345">
    </form>
</div>
</body>
</html>