<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ page import="model.User"%>

<%
User user = (User) session.getAttribute("user");
if(user == null){
    response.sendRedirect("login.jsp");
    return;
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AI Digital Detox Planner</title>

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

background:linear-gradient(135deg,#c8f7d4,#f8fffb);

overflow:hidden;

}

.container{

width:1100px;
height:650px;

background:white;

border-radius:25px;

display:flex;

box-shadow:0 20px 50px rgba(0,0,0,.15);

overflow:hidden;

}

/* LEFT */

.left{

flex:1;

background:linear-gradient(160deg,#2E8B57,#42b883);

color:white;

padding:60px;

display:flex;

flex-direction:column;

justify-content:center;

}

.left h1{

font-size:48px;

margin-bottom:20px;

}

.left p{

font-size:18px;

line-height:30px;

opacity:.95;

margin-bottom:40px;

}

.phone{

width:220px;
height:420px;

margin:auto;

background:white;

border-radius:35px;

position:relative;

box-shadow:0 10px 30px rgba(0,0,0,.25);

}

.screen{

position:absolute;

top:20px;
left:15px;

width:190px;
height:380px;

background:#eafaf1;

border-radius:25px;

display:flex;

flex-direction:column;

align-items:center;

padding-top:30px;

}

.circle{

width:80px;
height:80px;

border-radius:50%;

background:#2E8B57;

display:flex;

justify-content:center;

align-items:center;

font-size:40px;

color:white;

margin-bottom:25px;

}

.bar{

width:130px;
height:10px;

background:#c9e7d4;

border-radius:20px;

margin:12px;

}

.small{

width:100px;

}

/* RIGHT */

.right{

flex:1;

display:flex;

justify-content:center;

align-items:center;

background:#f9fcfa;

}

.card{

width:420px;

background:white;

padding:40px;

border-radius:20px;

box-shadow:0 10px 25px rgba(0,0,0,.08);

}

.card h2{

text-align:center;

color:#2E8B57;

margin-bottom:10px;

}

.card p{

text-align:center;

color:#777;

margin-bottom:30px;

}

.form-group{

margin-bottom:20px;

}

label{

display:block;

font-weight:600;

margin-bottom:8px;

}

input{

width:100%;

padding:14px;

border-radius:10px;

border:1px solid #ccc;

font-size:15px;

transition:.3s;

}

input:focus{

outline:none;

border-color:#2E8B57;

box-shadow:0 0 8px rgba(46,139,87,.25);

}

button{

width:100%;

padding:15px;

border:none;

border-radius:10px;

background:#2E8B57;

color:white;

font-size:17px;

cursor:pointer;

transition:.3s;

}

button:hover{

background:#246b45;

transform:translateY(-2px);

}

.footer{

text-align:center;

margin-top:20px;

font-size:14px;

color:#888;

}

.success{

background:#d4edda;

padding:12px;

border-radius:8px;

margin-bottom:15px;

color:#155724;

}

.error{

background:#f8d7da;

padding:12px;

border-radius:8px;

margin-bottom:15px;

color:#721c24;

}

</style>

</head>

<body>

<div class="container">

<div class="left">

<h1>🌿 AI Digital Detox Planner</h1>

<p>

Reduce your daily screen time and build healthier digital habits.

Set your personal goal and begin your digital wellness journey today.

</p>

<div class="phone">

<div class="screen">

<div class="circle">🌱</div>

<div class="bar"></div>

<div class="bar small"></div>

<div class="bar"></div>

<div class="bar small"></div>

<div class="bar"></div>

</div>

</div>

</div>

<div class="right">

<div class="card">

<h2>Create Detox Plan</h2>

<p>Set your daily screen time target.</p>

<%

String success=(String)request.getAttribute("success");
String error=(String)request.getAttribute("error");

if(success!=null){

%>

<div class="success"><%=success%></div>

<%

}

if(error!=null){

%>

<div class="error"><%=error%></div>

<%

}

%>

<form action="PlannerServlet" method="post">

<div class="form-group">

<label>Target Screen Time (Hours / Day)</label>

<input
type="number"
name="targetHours"
step="0.5"
min="1"
max="24"
placeholder="Example : 4"
required>

</div>

<div class="form-group">

<label>Start Date</label>

<input
type="date"
name="startDate"
required>

</div>

<div class="form-group">

<label>End Date</label>

<input
type="date"
name="endDate"
required>

</div>

<button type="submit">

🌿 Save Detox Plan

</button>

</form>

<div class="footer">

Stay Focused • Stay Healthy 🌱

</div>

</div>

</div>

</div>

</body>
</html>