

<%@page import="persistence.dao.CategorieDAO"%>
<%@page import="java.util.List"%>
<%@page import="persistence.dao.ProjectDAO"%>
<%@page import="gestors.ProjectsService"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <jsp:include page="includes/header.jsp"/>   
    </head>

    <body>

        <jsp:include page="includes/menu.jsp"/>   


        <div class="container">
            <div class="offset8 right">
                <form class="form-search">
                    <input type="text" class="input-medium search-query">
                    <button type="submit" class="btn">Search</button>
                </form>
            </div>
            <% List<ProjectDAO> mostPopularProjects = ProjectsService.getMostPopular();%>

            <div class="offset1 span12">
                <h3>Project of the week</h3>
                <div class="span10">
                    <div class="span2"><img src="resources/images/trench.png"></div>
                    <div class="span2">
                        <h4>Trench Mobile APP</h4>
                        <p>Find great recommendations on your phone that are customized to your tastes. Discover restaurants, hotels, coffee shops, movies, and fun activities near you, plus get recommendations on electronics, music, TV shows, books and more.</p>
                    </div>
                    <div class="span5">
                        <iframe width="440" height="260" src="http://www.youtube.com/embed/VDnr2z1KJZI" frameborder="0" allowfullscreen></iframe>
                    </div>
                    <div class="span2 pull-right">
                        <a href="projects/project.jsp?id=99" class="btn btn-warning"> JOIN</a>
                        <a href="projects/project.jsp?id=99" class="btn btn-success"> INVEST</a>
                    </div> 
                </div>
                <div class="span5"></div>
            </div>


            <div class="offset1">
                <h3>Last projects</h3>
                <%if (mostPopularProjects != null) {
                        for (ProjectDAO p : mostPopularProjects) {
                %>
                <div class="span2 well">
                    <img src="resources/images/project_imgs/enterprise-support.png" class="img-circle"/>
                    <h4><%=p.getName()%></h4>
                    <p><small><%=p.getDescription()%></small></p>
                </div>
                <%
                        }
                    }
                %>
            </div>


            <% List<CategorieDAO> cats = ProjectsService.getCategories();%> 

            <div class="offset10">
                <h3>Categories</h3> 
                <ul class="unstyled">
                    <%for (CategorieDAO c : cats) {
                    %>
                    <li class="unstyled"> <%=c.getName()%></li>
                    <%
                        }%>
                </ul>
            </div>
            <!-- Example row of columns -->
            <div class ="row">
                <div class  

                     ="span12">
                    <h4>Random projects</h4>
                    <img src="resources/images/project_imgs/project1.png" class  

                         ="img-polaroid"/>
                    <img src="resources/images/project_imgs/project2.png" class  

                         ="img-polaroid"/>
                    <img src="resources/images/project_imgs/project3.png" class  

                         ="img-polaroid"/>
                    <img src="resources/images/project_imgs/project4.png" class  

                         ="img-polaroid" width="128px"/>
                    <img src="resources/images/project_imgs/project5.png" class  
                         ="img-polaroid"/>
                </div>
            </div>

            <hr>

            <jsp:include page="includes/footer.jsp"/>  

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
