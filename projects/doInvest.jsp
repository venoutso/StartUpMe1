<%@page import="persistence.dao.UserDAO"%>
<%@page import="gestors.ProjectsService"%>
<%@page import="persistence.dao.ProjectDAO"%>
<%@page import="persistence.dao.NeedDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%


//    String input_need_name = request.getParameter("input_need_name");
    int input_amount_invesment = (int) new Integer(request.getParameter("input_amount_invesment"));
    ProjectDAO p = (ProjectDAO) session.getAttribute("lastProjectVisited");
    UserDAO us = (UserDAO) session.getAttribute("userSession");
    String ref = request.getParameter("ref");
    int needId = (int) new Integer(request.getParameter("needID"));

    ProjectsService.addCollaboration(us, p, needId, input_amount_invesment);


    String appPath = request.getContextPath();
    if (ref != null && !ref.isEmpty()) {
        response.sendRedirect(appPath + "/" + ref + "?id=" + p.getId());
    } else {
        response.sendRedirect(appPath + "/index.jsp");
    }
%>