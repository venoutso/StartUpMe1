<%@ page isErrorPage="true" %>
<html>
    <head>
        <title>Opps...</title>
    </head>
    <body>
        <h1>Opps...</h1>
        <p>Sorry, an error occurred.</p>
        <p>Here is the exception stack trace: </p>

        <P>
            <% exception.printStackTrace(response.getWriter());%>
        </P>
    </body>
</html>