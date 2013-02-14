
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>


<!--to use this you only have to include this file and send two parameters via url:
eg:
?type=info&msg="hola%20que%20pasa"-->

<%    
    
    String msg = request.getParameter("msg");
    String type = request.getParameter("type");
//       types : [alert-success,alert-error,alert-success,alert-info]
    if (msg != null && type != null) {
        
%>
<script src="resources/js/jquery.js"></script>
<script src="resources/js/bootstrap-alert.js"></script>
<div class="alert alert-<%=type%> span7" style="">  
    <a class="close" data-dismiss="alert">×</a>  
    <%=msg%>
</div>  

<%}%>




