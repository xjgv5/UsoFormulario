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
            <div class="col-sm-4">
                <input type="text" name="username" id="username" class="form-control" value="${param.username}">
            </div>
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
            <div class="col-sm-4">
                <input type="email" name="email" id="email" class="form-control" value="${param.email}">
            </div>
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
                    <option value="ES" ${param.pais.equals("ES") ? "selected" : ""}>España</option>
                    <option value="MX" ${param.pais.equals("MX") ? "selected" : ""}>México</option>
                    <option value="CL" ${param.pais.equals("CL") ? "selected" : ""}>Chile</option>
                    <option value="AR" ${param.pais.equals("AR") ? "selected" : ""}>Argentina</option>
                    <option value="PE" ${param.pais.equals("PE") ? "selected" : ""}>Perú</option>
                    <option value="CO" ${param.pais.equals("CO") ? "selected" : ""}>Colombia</option>
                    <option value="VE" ${param.pais.equals("VE") ? "selected" : ""}>Venezuela</option>
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
                    <option value="java" ${paramValues.lenguajes.stream().anyMatch(v -> v.equals("java")).get() ? "selected" : ""}>Java SE</option>
                    <option value="jakartaee" ${paramValues.lenguajes.stream().anyMatch(v -> v.equals("jakartaee")).get() ? "selected" : ""}>Jakarta EE9</option>
                    <option value="spring" ${paramValues.lenguajes.stream().anyMatch(v -> v.equals("spring")).get() ? "selected" : ""}>Spring Boot</option>
                    <option value="js" ${paramValues.lenguajes.stream().anyMatch(v -> v.equals("js")).get() ? "selected" : "javascript"}>Javascript</option>
                    <option value="angular" ${paramValues.lenguajes.stream().anyMatch(v -> v.equals("angular")).get() ? "selected" : ""}>Angular</option>
                    <option value="react" ${paramValues.lenguajes.stream().anyMatch(v -> v.equals("react")).get() ? "selected" : ""}>React</option>
                </select>
            </div>
            <%
                if (errores != null && errores.containsKey("lenguajes")) {
                    out.println("<small class='alert alert-danger' style='color: red;'>" + errores.get("lenguajes") + "</small>");
                }
            %>
        </div>
        <div class="row mb-3"> <!-- Roles -->
            <label class="col-form-label col-sm-2">Roles</label>
            <div class="form-check col-sm-2">
                <input type="checkbox" name="roles" value="ROLE_ADMIN" class="form-check-input" ${paramValues.lenguajes.stream().anyMatch(v -> v.equals("ROLE_ADMIN")).get() ? "checked" : ""}>
                <label class="form-check-label">Administrador</label>
            </div>

            <div class="form-check col-sm-2">
                <input type="checkbox" name="roles" value="ROLE_USER" class="form-check-input" ${paramValues.lenguajes.stream().anyMatch(v -> v.equals("ROLE_USER")).get() ? "checked" : ""}>
                <label class="form-check-label">Usuario</label>
            </div>

            <div class="form-check col-sm-2">
                <input type="checkbox" name="roles" value="ROLE_MODERATOR" class="form-check-input" ${paramValues.lenguajes.stream().anyMatch(v -> v.equals("ROLE_MODERATOR")).get() ? "checked" : ""}>
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
                <input type="radio" id="esp" name="idioma" value="es" class="form-check-input" ${param.idioma.equals("es") ? "checked" : ""}>
                <label for="esp">Español</label>
            </div>
            <div class="form-check col-sm-2">
                <input type="radio" id="ing" name="idioma" value="en" class="form-check-input" ${param.idioma.equals("en") ? "checked" : ""}>
                <label for="ing">Inglés</label>
            </div>
            <div class="form-check col-sm-2">
                <input type="radio" id="frn" name="idioma" value="fr" class="form-check-input" ${param.idioma.equals("fr") ? "checked" : ""}>
                <label for="frn">Francés</label>
            </div>
            <%
                if (errores != null && errores.containsKey("idioma")) {
                    out.println("<small class='alert alert-danger' style='color: red;'>" + errores.get("idioma") + "</small>");
                }
            %>
            <div class="row mb-3">
                <label for="habilitar" class="col-form-label col-sm-2">Habilitar</label>
                <div class="form-check col-sm-2">
                    <input type="checkbox" name="habilitar" id="habilitar" checked class="form-input-check">
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