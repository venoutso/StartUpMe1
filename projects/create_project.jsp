<%@page import="java.util.List"%>
<%@page import="persistence.dao.CategorieDAO"%>
<%@page import="persistence.dao.UserDAO"%>
<%@page import="gestors.ProjectsService"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Project creation</title>

        <jsp:include page="../sign/header_2.jsp"/> 

    </head>
    <body>
        <script src="../resources/js/jquery.js"></script>
        <script src="../resources/js/bootstrap-alert.js"></script>
        <div class="alert alert-success span7" style="display: none;">  
            <a class="close" data-dismiss="alert">×</a>  
            <strong>Success!</strong> Project successfully created. Now, <a href="add_requirements.jsp"> click here </a>to add requirements. 
        </div>  



        <jsp:include page="../includes/ckeck_logged.jsp"/>   
        <%
            String projectName = request.getParameter("input_project_name");
            String shortDescription = request.getParameter("input_project_shortdesc");
            String description = request.getParameter("input_project_description");
            String endDate = request.getParameter("input_project_endDate");
            String category = request.getParameter("select_category");

            UserDAO user = (UserDAO) session.getAttribute("userSession");

            if (user != null && projectName != null && shortDescription != null && category != null && endDate != null) {
                if (ProjectsService.createProject(projectName, category, description, shortDescription, endDate, user)) {
        %>  <script>
            $(document).ready(function() {
                $(".alert").toggle();
            });
        </script><%                           }
            }

        %>        

        <div class="container">
            <div id="create_project_form" class="span6">
                <form method="POST" action="create_project.jsp">
                    <fieldset>
                        <legend>Name <input type="text" placeholder="eg: StartUp Me" maxlength="30" class="pull-right" name="input_project_name"></legend>
                        <label>Short Description <input type="text" placeholder="eg: Crowdfunding and crowdsourcing web aplication" maxlength="50" class="span4 pull-right" name="input_project_shortdesc"/></label>
                        <label>Description</label>
                        <label><textarea class="field span6" rows="6" name="input_project_description"></textarea> </label>

                        <label class="pull-right">Category    

                            <select name="select_category" >  
                                <% List<CategorieDAO> cats = ProjectsService.getCategories();%>  
                                <% for (CategorieDAO c : cats) {%>  
                                <option><%=c.getName()%></option>  
                                <% }%>  
                            </select>  
                        </label>
                        <label>End date <input type="date" class="span2" name="input_project_endDate"/></label>
                        <label class="pull-right">

                            <button type="submit" class="btn btn-success">Create</button>
                            <a class="btn btn-danger" href="../index.jsp"> Cancel</a>
                        </label>
                    </fieldset>
                </form>
            </div>
        </div>
    </body>
</html>
