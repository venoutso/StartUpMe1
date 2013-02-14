

<%@page import="persistence.dao.UserDAO"%>


<%@page import="gestors.LoginService"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
    String username = request.getParameter("login_username");
    String password = request.getParameter("login_password");
    String ref = request.getParameter("ref");
    UserDAO user = LoginService.login(username, password);

    if (user != null) {
        session.setAttribute("userSession", user);
    } else {
        System.out.println("User was logged before");
    }

    String appPath = request.getContextPath();
    if (ref != null && !ref.isEmpty()) {
        response.sendRedirect(appPath + "/" + ref);
    } else {
        response.sendRedirect(appPath + "/index.jsp");
    }
%>
