<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AI Digital Detox Planner - Login</title>

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
    overflow:hidden;
    position:relative;

    background:
        linear-gradient(rgba(255,255,255,0.20),
                        rgba(255,255,255,0.20)),
        url("images/backgroundlp.png");

    background-size:cover;
    background-position:center;
    background-repeat:no-repeat;
    background-attachment:fixed;
}

/* Full Screen Glass Layer */
body::before{
    content:"";
    position:absolute;
    inset:0;

    background:rgba(255,255,255,0.10);

    backdrop-filter:blur(4px);
    -webkit-backdrop-filter:blur(4px);

    z-index:0;
}

/* Decorative Glass Circles */
.circle1{
    position:absolute;
    width:350px;
    height:350px;
    border-radius:50%;

    background:rgba(255,255,255,0.15);

    top:-120px;
    left:-100px;

    backdrop-filter:blur(20px);
}

.circle2{
    position:absolute;
    width:250px;
    height:250px;
    border-radius:50%;

    background:rgba(255,255,255,0.15);

    bottom:-80px;
    right:-80px;

    backdrop-filter:blur(20px);
}

/* Floating Leaves */
.leaf{
    position:absolute;
    top:-120px;
    font-size:32px;
    opacity:0.85;
    z-index:0;
    pointer-events:none;

    animation:fall linear infinite;
}

.leaf1{
    left:5%;
    animation-duration:12s;
    animation-delay:0s;
}

.leaf2{
    left:18%;
    animation-duration:16s;
    animation-delay:2s;
}

.leaf3{
    left:32%;
    animation-duration:10s;
    animation-delay:1s;
}

.leaf4{
    left:48%;
    animation-duration:18s;
    animation-delay:4s;
}

.leaf5{
    left:63%;
    animation-duration:14s;
    animation-delay:2s;
}

.leaf6{
    left:78%;
    animation-duration:15s;
    animation-delay:3s;
}

.leaf7{
    left:92%;
    animation-duration:11s;
    animation-delay:1s;
}

@keyframes fall{

    0%{
        transform:translateY(-120px) rotate(0deg);
    }

    25%{
        transform:translateY(25vh) translateX(35px) rotate(90deg);
    }

    50%{
        transform:translateY(50vh) translateX(-35px) rotate(180deg);
    }

    75%{
        transform:translateY(75vh) translateX(25px) rotate(270deg);
    }

    100%{
        transform:translateY(120vh) translateX(-25px) rotate(360deg);
    }
}

/* Login Card */
.login-box{
    position:relative;
    z-index:1;

    width:430px;
    padding:35px;

    background:rgba(255,255,255,0.28);

    backdrop-filter:blur(30px);
    -webkit-backdrop-filter:blur(30px);

    border:1px solid rgba(255,255,255,0.4);
    border-radius:25px;

    box-shadow:
    0 8px 32px rgba(0,0,0,0.15),
    inset 0 1px 0 rgba(255,255,255,0.5);
}

.logo{
    width:90px;
    height:90px;
    margin:auto;

    border-radius:50%;

    display:flex;
    align-items:center;
    justify-content:center;

    background:rgba(255,255,255,0.3);

    border:2px solid rgba(255,255,255,0.5);

    font-size:40px;
}

h1{
    text-align:center;
    margin-top:20px;

    color:#114b1e;
    font-size:36px;
    font-weight:800;
}

.subtitle{
    text-align:center;
    margin-top:10px;
    margin-bottom:30px;

    color:#234d20;
    font-size:15px;
}

label{
    display:block;
    margin-bottom:8px;

    color:#123d1b;
    font-weight:600;
}

.input-box{
    width:100%;
    padding:15px;
    margin-bottom:20px;

    background:rgba(255,255,255,0.45);

    border:1px solid rgba(255,255,255,0.6);

    border-radius:14px;
    outline:none;

    font-size:15px;
}

.input-box:focus{
    border:1px solid #2e7d32;
    background:rgba(255,255,255,0.65);
}

.options{
    display:flex;
    justify-content:space-between;
    align-items:center;

    margin-bottom:25px;
    font-size:14px;
}

.options label{
    margin:0;
}

.options a{
    text-decoration:none;
    color:#1b5e20;
    font-weight:bold;
}

.btn{
    width:100%;
    padding:15px;

    border:none;
    border-radius:14px;

    background:linear-gradient(
    135deg,
    #43a047,
    #2e7d32);

    color:white;
    font-size:18px;
    font-weight:bold;

    cursor:pointer;
    transition:0.3s;
}

.btn:hover{
    transform:translateY(-2px);
    box-shadow:0 5px 15px rgba(46,125,50,0.4);
}

.register{
    text-align:center;
    margin-top:25px;

    color:#123d1b;
}

.register a{
    text-decoration:none;
    color:#1b5e20;
    font-weight:bold;
}

@media(max-width:500px){

    .login-box{
        width:90%;
        padding:25px;
    }

    h1{
        font-size:30px;
    }
}

</style>
</head>

<body>

<!-- Floating Leaves -->
<div class="leaf leaf1">🍃</div>
<div class="leaf leaf2">🌿</div>
<div class="leaf leaf3">🍃</div>
<div class="leaf leaf4">🌱</div>
<div class="leaf leaf5">🍃</div>
<div class="leaf leaf6">🌿</div>
<div class="leaf leaf7">🍃</div>

<div class="circle1"></div>
<div class="circle2"></div>

<div class="login-box">

    <div class="logo">🌿</div>

    <h1>Welcome Back</h1>

    <p class="subtitle">
        Login to continue your digital detox journey
    </p>

    <form action="LoginServlet" method="post">

        <label>Email Address</label>
        <input type="email"
               name="email"
               class="input-box"
               placeholder="Enter your email"
               required>

        <label>Password</label>
        <input type="password"
               name="password"
               class="input-box"
               placeholder="Enter your password"
               required>

        <div class="options">
            <label>
                <input type="checkbox">
                Remember Me
            </label>

            <a href="forgotPassword.jsp">Forgot Password?</a>
        </div>

        <input type="submit"
               value="Login"
               class="btn">

    </form>

    <div class="register">
        New here?
        <a href="register.jsp">Register Here</a>
    </div>

</div>

</body>
</html>
