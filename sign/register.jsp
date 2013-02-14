
<%@page import="gestors.RegistrationService"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <title>StartUp Me - SignUp</title>
        <jsp:include page="header_2.jsp"/>   
    </head>


    <body>
        <%! 
        String name=null;
        String email = null;
           String pass = null;
           String speciality =null;
           String birth_date = null;
           String country = null;
           String gravatarID = null;
           String googleCodeID = null;
           String linkedInID = null;
           String facebookID = null;
           String twitterURL = null;

        %>

        <%
    name = request.getParameter("input_name");
    email = request.getParameter("input_email");
    pass = request.getParameter("input_password");
    speciality = request.getParameter("input_speciality");
    birth_date = request.getParameter("input_birth_date");
    country = request.getParameter("input_country");
    gravatarID = request.getParameter("input_gravatar");
    googleCodeID = request.getParameter("input_google_code");
    linkedInID = request.getParameter("input_linkedin");
    facebookID = request.getParameter("input_fb_adress");
    twitterURL = request.getParameter("input_twitter");



   if(name!=null && email!=null && pass!=null){
   RegistrationService.signUpUser(email, pass, name,speciality,birth_date,country,gravatarID,googleCodeID,linkedInID,facebookID,twitterURL);  
   response.sendRedirect("reg_result.jsp");
   }

        %>


        <div class="container">
            <div id="registration_form" class="offset1 span10">
                <form action="register.jsp" method="POST">
                    <fieldset class="span3">
                        <legend>Create an account</legend>
                        <label>*Full name</label>  <input type="text" id="input_name" name="input_name"/>
                        <label>*Email</label> <input type="email" id="input_email" name="input_email"/>
                        <label>*Password</label> <input type="password"  id="input_password" name="input_password"/>

                    </fieldset>


                    <div class="span3">
                        <fieldset>
                            <legend>Personal Data</legend>
                            <label>Occupation/Specialty</label>  <input type="text" id="input_speciality" name="input_speciality"/>
                            <label>Birth Date</label>  <input type="date" id="input_birth_date" name="input_birth_date"/>
                            <label>Nationality</label>  <jsp:include page="countries_selector.jsp"/>  
                        </fieldset>
                    </div>


                    <div class="span3">
                        <fieldset>
                            <legend>Social profile</legend>
                            <label>Gravatar ID</label> <input type="text" id="input_gravatar" name="input_gravatar"/>
                            <label>Google code ID</label> <input type="text"  id="input_google_code" name="input_google_code"/>
                            <label>LinkedIn ID</label> <input type="text"  id="input_linkedin" name="input_linkedin"/>
                            <label>Facebook Address</label> <input type="text" id="input_fb_adress" name="input_fb_adress"/>
                            <label>Twitter Address</label> <input type="text" id="input_twitter" name="input_twitter"/>
                        </fieldset>
                        <input type="submit" name="submit" class="btn" value="Sign up!">
                    </div>

                </form>

            </div>
        </div>



        <jsp:include page="../includes/footer.jsp"/>   
    </body>
</html>

