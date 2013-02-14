<%@page import="persistence.dao.CategorieDAO"%>
<%@page import="java.util.List"%>
<%@page import="persistence.dao.ProjectDAO"%>
<%@page import="gestors.ProjectsService"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="../sign/header_2.jsp"/>    
        <title>StartupMe - Projects </title>

    </head>

    <body>

        <jsp:include page="../includes/menu.jsp"/>   


        <div class="container">
            <div class="offset8 right">
                <form class="form-search">
                    <input type="text" class="input-medium search-query">
                    <button type="submit" class="btn">Search</button>
                </form>
            </div>
            <% List<ProjectDAO> mostPopularProjects = ProjectsService.getMostPopular();
                List<ProjectDAO> newestProjects = ProjectsService.getNewestProjects();
                List<ProjectDAO> randomProjects = ProjectsService.getRandomProjects();
            %>
            <div class="offset1">

                <div id="content">
                    <ul id="tabs" class="nav nav-tabs" data-tabs="tabs">
                        <li class="active"><a href="#red" data-toggle="tab">Newest Projects</a></li>
                        <li><a href="#orange" data-toggle="tab">Most popular</a></li>
                        <li><a href="#yellow" data-toggle="tab">Random</a></li>

                    </ul>
                    <div id="my-tab-content" class="tab-content">
                        <div class="tab-pane active" id="red">
                            <h3>Newest Projects</h3>
                            <%if (newestProjects != null) {
                                    for (ProjectDAO p : newestProjects) {
                            %>
                            <div class="span2 well">
                                <img src="../resources/images/project_imgs/enterprise-support.png" class="img-circle"/>
                                <h4><%=p.getName()%></h4>
                                <p><small><%=p.getDescription()%></small></p>
                            </div>
                            <%
                                    }
                                }
                            %>
                        </div>
                        <div class="tab-pane" id="orange">
                            <h3>Most popular projects</h3>
                            <%if (mostPopularProjects != null) {
                                    for (ProjectDAO p : mostPopularProjects) {
                            %>
                            <div class="span2 well">
                                <img src="../resources/images/project_imgs/enterprise-support.png" class="img-circle"/>
                                <h4><%=p.getName()%></h4>
                                <p><small><%=p.getDescription()%></small></p>
                            </div>
                            <%
                                    }
                                }
                            %>
                        </div>
                        <div class="tab-pane" id="yellow">
                            <h3>Random projects</h3>
                            <%if (randomProjects != null) {
                                    for (ProjectDAO p : randomProjects) {
                            %>
                            <div class="span2 well">
                                <img src="../resources/images/project_imgs/enterprise-support.png" class="img-circle"/>
                                <h4><%=p.getName()%></h4>
                                <p><small><%=p.getDescription()%></small></p>
                            </div>
                            <%
                                    }
                                }
                            %>
                        </div>

                    </div>
                </div>


                <script type="text/javascript">
                    jQuery(document).ready(function ($) {
                        $('#tabs').tab();
                    });
                </script>    
            </div> <!-- container -->
        </div>



        <hr>

        <jsp:include page="../includes/footer.jsp"/>  

    </div> <!-- /container -->

    <!-- Le javascript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="resources/js/jquery.js"></script>
    <script src="resources/js/bootstrap-transition.js"></script>
    <script src="resources/js/bootstrap-alert.js"></script>
    <script src="resources/js/bootstrap-modal.js"></script>
    <script src="resources/js/bootstrap-dropdown.js"></script>
    <script src="resources/js/bootstrap-scrollspy.js"></script>
    <script src="resources/js/bootstrap-tab.js"></script>
    <script src="resources/js/bootstrap-tooltip.js"></script>
    <script src="resources/js/bootstrap-popover.js"></script>
    <script src="resources/js/bootstrap-button.js"></script>
    <script src="resources/js/bootstrap-collapse.js"></script>
    <script src="resources/js/bootstrap-carousel.js"></script>
    <script src="resources/js/bootstrap-typeahead.js"></script>



</body>


</html>
