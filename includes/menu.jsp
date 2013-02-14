<%@page import="persistence.dao.ProjectDAO"%>
<%@page import="persistence.dao.UserDAO"%>


<% UserDAO u = (UserDAO) session.getAttribute("userSession");%>
<div class="navbar navbar-inverse navbar-fixed-top">
    <div class="navbar-inner">
        <div class="container">
            <a class="brand" style="color: rgb(180, 180, 180);
               font-size: 2em; font-family:sans-serif;
               line-height: 0.8em; margin: 0; " href="/StartUpMe/index.jsp">StartUp<b>ME</b></a>
            <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
                <span class="icon-bar"> </span>
                <span class="icon-bar"> </span>
                <span class="icon-bar"> </span>
            </a>

            <div class="nav-collapse collapse">
                <ul class="nav">
                    <li class="active"><a href="/StartUpMe/index.jsp">Home</a></li>
                    <li><a href="/StartUpMe/projects/allProjects.jsp">All projects</a></li>
                    <li><a href="/StartUpMe/projects/create_project.jsp">Start a project</a></li>
                    <% if (u != null) {
                    %>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">My Projects <b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <%   for (ProjectDAO userProject : u.getProjectDAOSet()) {%>
                            <li><a href="./projects/project.jsp?id=<%=userProject.getId()%>"><%=userProject.getName()%></a></li> <%}%>
                        </ul>
                    </li>
                    <%}%>
                </ul>
                <%
                    if (u != null) {
                %><div id="session_info"><form class="navbar-form pull-right" method="POST" action="sign/doLogout.jsp">
                        <span class="label label-info"><%=u.getEmail()%></span>
                        <input type="submit" name="submit" class="btn" value="Log out">
                    </form></div>
                    <%
                    } else {%>

                <form class="navbar-form pull-right" method="POST" action="/StartUpMe/sign/doLogin.jsp">
                    <input class="span2" type="text" name="login_username" placeholder="Email">
                    <input class="span2" type="password" name="login_password" placeholder="Password">
                    <input type="submit" name="submit" class="btn" value="Sign in">
                </form>
                <%   }
                %>
            </div><!--/.nav-collapse -->
        </div>
    </div>
</div>