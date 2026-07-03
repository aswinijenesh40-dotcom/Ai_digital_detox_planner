<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ page import="model.User" %>

<%
User user = (User) session.getAttribute("user");

if(user == null){
    response.sendRedirect("login.jsp");
    return;
}

String avatar = "";

if(user.getName()!=null && !user.getName().isEmpty()){
    avatar = user.getName().substring(0,1).toUpperCase();
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Profile</title>

<style>

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:'Segoe UI',sans-serif;
}

body{
    background:linear-gradient(135deg,#d9f8e6,#b7efd2,#9ae6c0);
    min-height:100vh;
    padding:40px;
}

.container{
    width:90%;
    max-width:1000px;
    margin:auto;
    background:#ffffff;
    border-radius:25px;
    overflow:hidden;
    box-shadow:0 15px 40px rgba(0,0,0,0.15);
}

.header{
    background:linear-gradient(135deg,#1b8f4d,#2ecc71);
    text-align:center;
    color:white;
    padding:45px;
}

.avatar{
    width:100px;
    height:100px;
    margin:auto;
    border-radius:50%;
    background:white;
    color:#1b8f4d;
    font-size:42px;
    font-weight:bold;
    display:flex;
    justify-content:center;
    align-items:center;
    margin-bottom:18px;
    border:5px solid rgba(255,255,255,.4);
}

.header h2{
    font-size:32px;
    margin-bottom:8px;
}

.header p{
    font-size:17px;
    opacity:.95;
}

.content{
    padding:40px;
}

.section-title{
    color:#1b8f4d;
    font-size:24px;
    margin-bottom:25px;
    border-left:6px solid #2ecc71;
    padding-left:12px;
}

.info{
    display:grid;
    grid-template-columns:repeat(2,1fr);
    gap:20px;
    margin-bottom:40px;
}

.box{
    background:#f2fff6;
    border-left:6px solid #2ecc71;
    border-radius:15px;
    padding:20px;
    transition:.3s;
}

.box:hover{
    transform:translateY(-5px);
    box-shadow:0 10px 20px rgba(0,0,0,.12);
}

.box strong{
    display:block;
    color:#1b8f4d;
    margin-bottom:10px;
    font-size:16px;
}

.stats{
    display:flex;
    gap:20px;
    margin-top:20px;
    margin-bottom:40px;
}

.stat{
    flex:1;
    background:linear-gradient(135deg,#1b8f4d,#2ecc71);
    color:white;
    border-radius:18px;
    padding:30px;
    text-align:center;
    transition:.3s;
}

.stat:hover{
    transform:scale(1.05);
}

.stat h3{
    font-size:34px;
    margin-bottom:10px;
}

.stat p{
    font-size:17px;
}

.actions{
    display:flex;
    justify-content:center;
    gap:20px;
    flex-wrap:wrap;
}

.btn{
    text-decoration:none;
    background:#1b8f4d;
    color:white;
    padding:14px 28px;
    border-radius:12px;
    font-size:16px;
    transition:.3s;
}

.btn:hover{
    background:#15713d;
    transform:translateY(-3px);
}

@media(max-width:768px){

.info{
grid-template-columns:1fr;
}

.stats{
flex-direction:column;
}

.actions{
flex-direction:column;
}

.btn{
text-align:center;
}

}

</style>

</head>

<body>

<div class="container">

<div class="header">

<div class="avatar">
<%= avatar %>
</div>

<h2><%= user.getName() %></h2>

<p>Digital Wellness Member</p>

</div>

<div class="content">

<h2 class="section-title">👤 Personal Information</h2>

<div class="info">

<div class="box">
<strong>Full Name</strong>
<%= user.getName() %>
</div>

<div class="box">
<strong>Email</strong>
<%= user.getEmail() %>
</div>
<div class="box">
<strong>User ID</strong>
<%= user.getUserId() %>
</div>

<div class="box">
<strong>Account Status</strong>
<span style="color:#1b8f4d;font-weight:bold;">Active</span>
</div>

</div>

<h2 class="section-title">📊 Wellness Statistics</h2>

<div class="stats">

<div class="stat">
<h3>12</h3>
<p>Detox Streak</p>
</div>

<div class="stat">
<h3>82%</h3>
<p>Focus Score</p>
</div>

<div class="stat">
<h3>3.5 hrs</h3>
<p>Daily Goal</p>
</div>

</div>

<div class="actions">

<a href="dashboard.jsp" class="btn">
🏠 Dashboard
</a>

<a href="planner.jsp" class="btn">
📝 Edit Plan
</a>

<a href="logout.jsp" class="btn">
🚪 Logout
</a>

</div>

</div>

</div>

</body>
</html>