
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<head>
    <jsp:include page="header_2.jsp"/>   
</head>

<div class="well">
    <b> Account successfully created </b></br>

    Now we are going to send you an email...bla bla bla
</div>
<div class="well">
    <p> Redirecting you in 5 seconds... </p>
</div>
<script type="text/javascript">
    function leave() {
        window.location = "../index.jsp";
    }
    setTimeout("leave()", 5000);
</script>


<jsp:include page="../includes/footer.jsp"/>  