<%@page import="gestors.ProjectsService"%>
<%@page import="persistence.dao.ProjectDAO"%>
<%@page import="persistence.dao.NeedDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%



//    String input_need_name = request.getParameter("input_need_name");
    String input_need_amount = request.getParameter("input_need_amount");
    String input_need_remuneration = request.getParameter("input_need_remuneration");
    String input_need_start = request.getParameter("input_need_start");
    String input_need_end = request.getParameter("input_need_end");
    String input_need_description = request.getParameter("input_need_description");
    ProjectDAO p = (ProjectDAO) session.getAttribute("lastProjectVisited");
    String ref = request.getParameter("ref");

    ProjectsService.addNeed(p, input_need_amount, input_need_remuneration, input_need_start, input_need_end, input_need_description);


    String appPath = request.getContextPath();
    if (ref != null && !ref.isEmpty()) {
        response.sendRedirect(appPath + "/" + ref + "?id=" + p.getId());
    } else {
        response.sendRedirect(appPath + "/index.jsp");
    }
%>