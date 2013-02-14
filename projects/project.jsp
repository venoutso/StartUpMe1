<%@page import="persistence.dao.TaCollaborations"%>
<%@page import="persistence.dao.UserDAO"%>
<%@page import="java.util.Set"%>
<%@page import="persistence.dao.NeedDAO"%>
<%@page import="persistence.dao.ProjectDAO"%>
<%@page import="gestors.ProjectsService"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page errorPage="../includes/showErrors.jsp" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <jsp:include page="../sign/header_2.jsp"/>    
        <title>StartupMe - Project </title>

    </head>

    <body>

        <jsp:include page="../includes/menu.jsp"/>   
        <%
            String projectID = request.getParameter("id");
            Integer id = new Integer(projectID);
            ProjectDAO p = ProjectsService.getProjectById(id);
            if (p != null) {
                session.setAttribute("lastProjectVisited", p);
            }



        %>

        <div class="container">
            <div class="span15">

                <div class="span9">
                    <div class="span3">
                        <h3><%=p.getName()%></h3>
                        <img src="../resources/images/project_imgs/project2.png" class="img-polaroid">
                    </div>
                    <div class="span5 right">
                        Short Description:
                        <%=p.getShortDescription()%>
                        </br>
                        Founder:
                        <%=p.getFounder().getName()%>
                        

                    </div>


                </div>
                <div class="offset8 right">
                    <form class="form-search">
                        <input type="text" class="input-medium search-query">
                        <button type="submit" class="btn">Search</button>
                    </form>
                </div>




            </div>
            </br></br>

            <div class="tabbable span9">
                <ul class="nav nav-tabs">
                    <li  class="active"><a href="#pane1" data-toggle="tab">Needs</a></li>
                    <li><a href="#pane2" data-toggle="tab">Description</a></li>
                    <li><a href="#pane3" data-toggle="tab">Involved People</a></li>
                </ul>
                <div class="tab-content">

                    <div id="pane1" class="tab-pane active">

                        <%
                            UserDAO us = (UserDAO) session.getAttribute("userSession");
                            if (us != null && p.getFounder().getId().equals(us.getId())) {
                        %> 

                        <%
                            Set<NeedDAO> needs = p.getNeedDAOSet();

                            if (needs.isEmpty()) {
                        %>
                        <p> <b>No needs until now </b></p>

                        <% } else {%>
                        <table class="table table-bordered table-condensed">
                            <thead>
                                <tr>
                                    <th>Code</th>
                                    <th>Description</th>
                                    <th>End Date</th>
                                    <th  colspan="2">Amount needed</th>
                                    <th  colspan="2">Remuneration</th>

                                </tr>
                            </thead>
                            <tbody>

                                <%
                                    for (NeedDAO n : needs) {
                                        Set<TaCollaborations> need_cols = n.getTaCollaborationsSet();
                                %>
                                <tr>
                                    <%String desc = n.getDescription();
                                        if (desc.length() > 50) {
                                            desc = desc.substring(0, 29);
                                        }
                                    %>


                                    <%
                                        int total_amount = 0;
                                        for (TaCollaborations col : need_cols) {
                                            total_amount = total_amount + col.getAmount();
                                        }
                                    %>
                                    <td><%=n.getId()%></td>
                                    <td><%=desc%></td>
                                    <td><%=n.getEndDate()%></td>
                                    <td> <%=total_amount%>/<%=(int) Math.floor(n.getAmountNeeded())%> n€t </td>
                                    <td>     
                                        <form action="doInvest.jsp?ref=project.jsp?needID='<%=n.getId()%>'">
                                            <input type="text" class="super_small_input"
                                                   name="input_amount_invesment">
                                            <button class="btn btn-info btn-mini btn-primary pull-right" data-toggle="modal">INV€ST</button>
                                        </form>

                                    </td>

                                    <td><%=n.getRemuneration()%>   </td> 
                                    <td>   <button class="btn  btn-warning btn-mini btn-primary pull-right" data-toggle="modal">JOIN WORK</button>
                                    </td> 
                                </tr>
                                <% }
                                %>
                            </tbody>
                        </table>
                        <%}%>





                        <label>
                            <a href="#addNeedModal" role="button" class="btn btn-success" data-toggle="modal">Add need</a>
                        </label>


                        <!--ADD NEED MODAL WINDOW-->
                        <div id="addNeedModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="addNeedModalLabel" aria-hidden="true">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                <h3 id="myModalLabel">Add new need</h3>
                            </div>
                            <form action="./doAddNeed.jsp?ref=project.jsp">
                                <div class="modal-body">
                                    <fieldset>
                                        <label>Name</label>
                                        <input type="text" name="input_need_name">
                                        <div class="pull-right"> 
                                            <div class="input-prepend input-append">
                                                <label>Amount needed</label>
                                                <span class="add-on">n€t</span>
                                                <input type="text" class="span1" name="input_need_amount">
                                                <span class="add-on">.00</span>
                                                <label>Remuneration</label>
                                                <span class="add-on">n€t</span>
                                                <input type="text" class="span1" name="input_need_remuneration">
                                                <span class="add-on">.00</span>
                                            </div>
                                        </div>
                                        <label>Start date: </label> <input type="date" name="input_need_start"> 
                                        <label> End date: </label><input type="date" name="input_need_end">
                                        <label>Description</label>
                                        <textarea name="input_need_description" class="span5" ></textarea>

                                </div>
                                <div class="modal-footer">
                                    <button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
                                    <button class="btn btn-primary">Create</button>
                                </div>
                            </form>
                        </div>
                        <% }%>

                    </div>





                    <div id="pane2" class="tab-pane">
                        <h4>Description:</h4>
                        <%=p.getDescription()%>

                    </div>

                    <div id="pane3" class="tab-pane">
                        <h4>Project contributors</h4>
                        <table class="table table-bordered table-condensed">
                            <thead>
                                <tr>
                                    <th>User</th>
                                    <th>Need </th>
                                    <th>Rol</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <%                                        Set<NeedDAO> needs = p.getNeedDAOSet();
                                        for (NeedDAO n : needs) {
                                            Set<TaCollaborations> need_cols = n.getTaCollaborationsSet();
                                            for (TaCollaborations col : need_cols) {

                                    %>
                                    <td><%= col.getUserDAO().getName()%></td>
                                    <td> <%= col.getNeedDAO().getId()%></td>   
                                    <td> <%= col.getRolDAO().getName()%></td> 
                                    <%  }
                                        }
                                    %>


                                </tr>
                            </tbody>
                        </table>

                    </div>

                </div><!-- /.tab-content -->
            </div><!-- /.tabbable -->


            <!-- Example row of columns -->
            <div class="row">
                <div class="span12">
                    <h4>Random projects</h4>
                    <img src="../resources/images/project_imgs/project1.png" class="img-polaroid"/>
                    <img src="../resources/images/project_imgs/project2.png" class="img-polaroid"/>
                    <img src="../resources/images/project_imgs/project3.png" class="img-polaroid"/>
                    <img src="../resources/images/project_imgs/project4.png" class="img-polaroid" width="128px"/>
                    <img src="../resources/images/project_imgs/project5.png" class="img-polaroid"/>
                </div>
            </div>

            <hr>

            <jsp:include page="../includes/footer.jsp"/>  

        </div> <!-- /container -->

        <!-- Le javascript
        ================================================== -->
        <!-- Placed at the end of the document so the pages load faster -->


        <!--        <script>
                        !function ($) {
                        $(function(){
                            // carousel demo
                            $('#myCarousel').carousel()
                        })
                    }(window.jQuery)
                </script>-->

    </body></html>

