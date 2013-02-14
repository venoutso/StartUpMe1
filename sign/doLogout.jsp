

<%@page import="persistence.dao.UserDAO"%>



<%@page import="gestors.LoginService"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%

    UserDAO user = (UserDAO) session.getAttribute("userSession");

    if (user != null) {
        session.removeAttribute("userSession");
    }

    String appPath = request.getContextPath();
    response.sendRedirect(appPath + "/index.jsp");
%>
