
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login</title>

     <%--<link rel="stylesheet" href="http://gdrtech.com/wp-content/uploads/2015/04/banner.jpg">--%>


    <link rel="stylesheet" href="style.css">


</head>

<body>

<div>
    <img src='image/banner.jpg' style='width:100%;height:100%' alt='[]'/>
<div class="login">



    <h2>LOGIN</h2>
    <form method="post" action="">
        <input type="radio" name="cookie" value="none"  checked> <label> NONE</label>
        <input type="radio" name="cookie" value="http"> <label> HTTP</label>
        <input type="radio" name="cookie" value="secure"> <label> SECURE</label>
        <input type="radio" name="cookie" value="both"> <label> BOTH</label>
        <fieldset>
            <input type="email" placeholder="Email" name="email"/>
            <input type="password" placeholder="Password" name="password"/>
        </fieldset>
        <input type="submit" value="Log In" name="login"/>
        <div class="utilities">
            <a href="#">Forgot Password?</a>
            <a href="#">Sign Up  &rarr;</a>
        </div>
    </form>
</div>
    </div>


</body>
</html>

<%
    if(request.getParameter("login")!=null) //trigger the login function
    {
        // credential are hardcode
        if(request.getParameter("password")!=""&&request.getParameter("email")!="") //check credential
        {
            String email = request.getParameter("email");
            String pass = request.getParameter("password");
            if ("admin@gmail.com".equals(email) && "admin".equals(pass)) // check credential
            {
                String radio =request.getParameter("cookie");//get radio buttion  value
                if("no".equals(radio))
                {
                    //no secure and httponly flags
                    Cookie cook = new Cookie("xl", "D35B5BC06A1F32FF37ABCEA55F536E29"); // create object
                    cook.setMaxAge(60);    //set max age for cookie in seconds
                    cook.setDomain("localhost"); //set domain for cookie
                    cook.setPath("/login-app");  // set path
                    response.addCookie(cook);  //create cookie
                    response.sendRedirect("index.jsp"); // redirect the page when cookies is create
                }
                else if("secure".equals(radio))
                {
                    //it has only secure flags
                    Cookie cook = new Cookie("xl", "D35B5BC06A1F32FF37ABCEA55F536E29");
                    cook.setMaxAge(60);
                    cook.setSecure(true);  // enable secure connection
                    cook.setDomain("localhost");
                    cook.setPath("/login-app");
                    response.addCookie(cook);
                    response.sendRedirect("index.jsp");
                }
                else if("http".equals(radio))
                {
                    //it has only httponly flags
                    Cookie cook = new Cookie("xl", "D35B5BC06A1F32FF37ABCEA55F536E29");
                    cook.setMaxAge(60);
                    cook.setHttpOnly(true); //java script can not run on this cookie
                    cook.setDomain("localhost");
                    cook.setPath("/login-app");
                    response.addCookie(cook);
                    response.sendRedirect("index.jsp");
                }
                else if("both".equals(radio))
                {
                    //it has secure and httponly flags
                    Cookie cook = new Cookie("xl", "D35B5BC06A1F32FF37ABCEA55F536E29");
                    cook.setMaxAge(60);
                    cook.setSecure(true);
                    cook.setHttpOnly(true);
                    cook.setDomain("localhost");
                    cook.setPath("/login-app");
                    response.addCookie(cook);
                    response.sendRedirect("index.jsp");
                }
            }
            else
            {
%>
<script>alert("Ivalid Email or password")</script>
<%
    }
}
else
{
%><script>alert("Please enter the email and password")</script><%
        }
    }

    if(request.getParameter("logout")!=null)
    {
        Cookie cook = new Cookie("xl", "");
        cook.setMaxAge(0);
        cook.setDomain("localhost");
        cook.setPath("/login-app");
        response.addCookie(cook);
    }
%>