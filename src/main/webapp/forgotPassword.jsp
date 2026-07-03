<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Forgot Password</title>
<style>
*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:'Segoe UI',sans-serif;
}

body{
    height:100vh;
    display:flex;
    justify-content:center;
    align-items:center;

    background: url("images/backgroundfpp.png") no-repeat center center/cover;
    position: relative;
}

/* dark overlay for better readability */
body::before{
    content:"";
    position:absolute;
    top:0;
    left:0;
    width:100%;
    height:100%;
    background: rgba(0,0,0,0.4);
    z-index:0;
}

.container{
    position:relative;
    z-index:1;
}

.container{
    width:380px;
    padding:35px;
    border-radius:20px;
    background:rgba(255,255,255,0.15);
    backdrop-filter:blur(15px);
    -webkit-backdrop-filter:blur(15px);
    border:1px solid rgba(255,255,255,0.2);
    box-shadow:0 8px 32px rgba(0,0,0,0.2);
    text-align:center;
    color:white;
}

.logo{
    font-size:50px;
    margin-bottom:10px;
}

h2{
    margin-bottom:10px;
}

.subtitle{
    font-size:14px;
    color:#f1f1f1;
    margin-bottom:25px;
}

.input-group{
    text-align:left;
    margin-bottom:20px;
}

.input-group label{
    display:block;
    margin-bottom:8px;
    font-weight:500;
}

.input-group input{
    width:100%;
    padding:12px;
    border:none;
    outline:none;
    border-radius:10px;
    background:rgba(255,255,255,0.2);
    color:white;
}

.input-group input::placeholder{
    color:#e0e0e0;
}

.btn{
    width:100%;
    padding:12px;
    border:none;
    border-radius:10px;
    background:white;
    color:#764ba2;
    font-size:16px;
    font-weight:bold;
    cursor:pointer;
    transition:0.3s;
}

.btn:hover{
    transform:translateY(-2px);
}

.back-link{
    margin-top:18px;
}

.back-link a{
    color:white;
    text-decoration:none;
    font-size:14px;
}

.back-link a:hover{
    text-decoration:underline;
}
</style>

</head>
<body>

<div class="container">

    <div class="logo">🔐</div>

    <h2>Forgot Password</h2>

    <p class="subtitle">
        Enter your registered email address
    </p>

    <form action="ForgotPasswordServlet" method="post">

        <div class="input-group">
            <label>Email Address</label>
            <input type="email"
                   name="email"
                   placeholder="Enter your email"
                   required>
        </div>

        <button type="submit" class="btn">
            Reset Password
        </button>

    </form>

    <div class="back-link">
        <a href="login.jsp">← Back to Login</a>
    </div>

</div>

</body>
</html>