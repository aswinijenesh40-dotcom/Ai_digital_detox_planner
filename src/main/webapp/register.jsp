<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>AI Digital Detox Planner | Register</title>

<style>

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:Arial, Helvetica, sans-serif;
}

body {
    height: 100vh;
    display: flex;
    justify-content: center;
    align-items: center;

    background:
    linear-gradient(rgba(0,0,0,0.55), rgba(0,0,0,0.55)),
    url("images/backgroundrp.png");

background-size: cover;
background-position: center;
background-repeat: no-repeat;
background-attachment: fixed;
}
.container{
    width:450px;
    padding:40px;
    background:rgba(255,255,255,0.12);
    backdrop-filter:blur(18px);
    -webkit-backdrop-filter:blur(18px);
    border-radius:20px;
    border:1px solid rgba(255,255,255,0.2);
    box-shadow:0 10px 30px rgba(0,0,0,0.35);
    color:white;
}


h1{
    text-align:center;
    margin-bottom:10px;
    font-size:38px;
}

.subtitle{
    text-align:center;
    margin-bottom:30px;
    color:#eeeeee;
    font-size:17px;
}

label{
    display:block;
    margin-top:18px;
    margin-bottom:8px;
    font-size:16px;
    font-weight:bold;
}

input[type=text],
input[type=email],
input[type=password]{
    width:100%;
    padding:14px;
    border-radius:10px;
    border:1px solid rgba(255,255,255,0.3);
    background:rgba(255,255,255,0.15);
    color:white;
    font-size:15px;
    outline:none;
}

input::placeholder{
    color:#dddddd;
}

input[type=submit]{
    width:100%;
    margin-top:30px;
    padding:15px;
    border:none;
    border-radius:10px;
    background:linear-gradient(to right,#00c6ff,#0072ff);
    color:white;
    font-size:18px;
    cursor:pointer;
}

input[type=submit]:hover{
    opacity:0.9;
}

.divider{
    display:flex;
    align-items:center;
    margin:25px 0;
}

.divider hr{
    flex:1;
    border:none;
    height:1px;
    background:#cccccc;
}

.divider span{
    padding:0 12px;
    color:white;
}

.footer-text{
    text-align:center;
    font-size:15px;
}

.footer-text a{
    color:#00e5ff;
    text-decoration:none;
    font-weight:bold;
}

.footer-text a:hover{
    text-decoration:underline;
}

.copyright{
    text-align:center;
    margin-top:20px;
    font-size:13px;
    color:#dddddd;
}

</style>

</head>

<body>

<div class="container">

<h1>AI Digital Detox Planner</h1>

<p class="subtitle">
Create your account to start your digital wellness journey
</p>

<form action="RegisterServlet" method="post">

<label>Full Name</label>
<input type="text"
       name="name"
       placeholder="Enter your full name"
       required>

<label>Email Address</label>
<input type="email"
       name="email"
       placeholder="Enter your email address"
       required>

<label>Password</label>
<input type="password"
       name="password"
       placeholder="Enter your password"
       required>

<input type="submit" value="Create Account">

</form>

<div class="divider">
<hr>
<span>OR</span>
<hr>
</div>

<div class="footer-text">
Already have an account?
<a href="login.jsp">Login Here</a>
</div>

<div class="copyright">
© 2026 AI Digital Detox Planner
</div>

</div>

</body>
</html>