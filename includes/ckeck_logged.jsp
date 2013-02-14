


<%@page import="persistence.dao.UserDAO"%>
<!--This page checks if the user is logged and redirect him if it's not-->

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<style type="text/css">
    body {
        padding-top: 40px;
        padding-bottom: 40px;
        background-color: #f5f5f5;
    }

    .form-signin {
        max-width: 300px;
        padding: 19px 29px 29px;
        margin: 0 auto 20px;
        background-color: #fff;
        border: 1px solid #e5e5e5;
        -webkit-border-radius: 5px;
        -moz-border-radius: 5px;
        border-radius: 5px;
        -webkit-box-shadow: 0 1px 2px rgba(0,0,0,.05);
        -moz-box-shadow: 0 1px 2px rgba(0,0,0,.05);
        box-shadow: 0 1px 2px rgba(0,0,0,.05);
    }
    .form-signin .form-signin-heading,
    .form-signin .checkbox {
        margin-bottom: 10px;
    }
    .form-signin input[type="text"],
    .form-signin input[type="password"] {
        font-size: 16px;
        height: auto;
        margin-bottom: 15px;
        padding: 7px 9px;
    }

</style>



<script src="../resources/js/jquery.js"></script>
<script src="../resources/js/bootstrap-modal.js"></script>


<div id="redirecting_dialog" class="modal hide fade" data-backdrop="static">
    <div class="modal-header">
        <h3><b>Sign in</b> or <a href="../sign/register.jsp"> create an account!</a></h3>
    </div>
    <div class="modal-body">
        <form class="form-signin"  method="POST" action="../sign/doLogin.jsp?ref=project/create_project.jsp">
            <h2 class="form-signin-heading">Please sign in</h2>
            <input type="text" class="input-block-level" placeholder="Email address" name="login_username">
            <input type="password" class="input-block-level" placeholder="Password" name="login_password">
            <label>
                <!--<input type="checkbox" value="remember-me"> Remember me-->
                <a href="">Forgot your password?</a>
            </label>
            <button class="btn btn-large btn-primary" type="submit">Login</button>
            <a href="../sign/register.jsp" class="pull-right btn btn-large btn-success">Sign up</a>
        </form>
    </div>
    <div class="modal-footer">
        <a onClick="history.back();" class="btn btn-danger">Get me out of here</a>
    </div>
</div>


<%

    UserDAO user = (UserDAO) session.getAttribute("userSession");
    if (user == null) {
%>


<script>
    var session =<%=user%>;
    if(session == 'null' || typeof(session) === 'undefined' || session == null){
        $('#redirecting_dialog').modal('show');
    }    
</script>


<%    } else {
        %>
<%    }
%>




