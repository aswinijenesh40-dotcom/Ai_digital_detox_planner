<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ page import="model.ProgressData"%>
<%@ page import="model.User"%>

<%
User user = (User) session.getAttribute("user");

if(user==null){
    response.sendRedirect("login.jsp");
    return;
}

ProgressData progress=(ProgressData)request.getAttribute("progressData");

if(progress==null){
    progress=new ProgressData();
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Progress</title>

<style>

*{
margin:0;
padding:0;
box-sizing:border-box;
font-family:'Segoe UI',sans-serif;
}

body{

min-height:100vh;
display:flex;
justify-content:center;
align-items:center;
padding:40px;

background:linear-gradient(135deg,#11998e,#38ef7d);

overflow-x:hidden;

}

.container{

width:1100px;
background:rgba(255,255,255,.18);

backdrop-filter:blur(15px);

border-radius:25px;

border:1px solid rgba(255,255,255,.3);

box-shadow:0 20px 40px rgba(0,0,0,.2);

padding:35px;

}

.header{

display:flex;
justify-content:space-between;
align-items:center;
margin-bottom:35px;

}

.left h1{

color:white;
font-size:38px;

}

.left p{

color:#f5f5f5;
font-size:18px;
margin-top:8px;

}

.circle{

width:120px;
height:120px;

border-radius:50%;

background:white;

display:flex;
justify-content:center;
align-items:center;
flex-direction:column;

box-shadow:0 10px 20px rgba(0,0,0,.15);

}

.circle h2{

color:#2e7d32;
font-size:36px;

}

.circle span{

font-size:14px;
color:gray;

}

.cards{

display:grid;
grid-template-columns:repeat(2,1fr);

gap:25px;

margin-top:20px;

}

.card{

background:white;

border-radius:20px;

padding:25px;

transition:.4s;

box-shadow:0 10px 25px rgba(0,0,0,.12);

}

.card:hover{

transform:translateY(-8px);

}

.icon{

font-size:40px;

margin-bottom:15px;

}

.card h3{

color:#2e7d32;

margin-bottom:15px;

}

.big{

font-size:34px;

font-weight:bold;

color:#222;

}

.small{

margin-top:10px;

font-size:15px;

color:gray;

}

.progress-section{

margin-top:40px;

}

.progress-section h2{

color:white;

margin-bottom:20px;

font-size:28px;

}

.progress-box{

background:white;

padding:25px;

border-radius:20px;

box-shadow:0 10px 25px rgba(0,0,0,.15);

}

.bar{

width:100%;

height:28px;

background:#dcdcdc;

border-radius:30px;

overflow:hidden;

margin-top:15px;

}

.fill{

height:100%;

background:linear-gradient(to right,#43a047,#1b5e20);

text-align:center;

color:white;

font-weight:bold;

line-height:28px;

transition:1s;

}
.details{

display:grid;

grid-template-columns:repeat(2,1fr);

gap:25px;

margin-top:30px;

}

.detail-card{

background:white;

padding:25px;

border-radius:20px;

box-shadow:0 10px 25px rgba(0,0,0,.15);

}

.detail-card h3{

color:#2e7d32;

margin-bottom:18px;

font-size:24px;

}

.info{

display:flex;

justify-content:space-between;

padding:12px 0;

border-bottom:1px solid #eeeeee;

font-size:17px;

}

.info:last-child{

border-bottom:none;

}

.label{

font-weight:600;

color:#555;

}

.value{

font-weight:bold;

color:#1b5e20;

}

.footer{

margin-top:35px;

text-align:center;

}

.btn{

display:inline-block;

padding:14px 35px;

background:#1b5e20;

color:white;

text-decoration:none;

border-radius:30px;

font-size:18px;

font-weight:bold;

transition:.3s;

}

.btn:hover{

background:#2e7d32;

transform:scale(1.05);

}

@media(max-width:900px){

.header{

flex-direction:column;

text-align:center;

gap:20px;

}

.cards{

grid-template-columns:1fr;

}

.details{

grid-template-columns:1fr;

}

}

</style>

</head>

<body>

<div class="container">

    <div class="header">

        <div class="left">
            <h1>Hello, <%= user.getName() %> 👋</h1>
            <p>Track your Digital Detox Journey</p>
        </div>

        <div class="circle">
            <h2><%= progress.getScore() %></h2>
            <span>Wellness Score</span>
        </div>

    </div>

    <div class="cards">

        <div class="card">
            <div class="icon">📱</div>
            <h3>Screen Time</h3>
            <div class="big"><%= progress.getHoursUsed() %> hrs</div>
            <div class="small">Today's usage</div>
        </div>

        <div class="card">
            <div class="icon">🎯</div>
            <h3>Target Hours</h3>
            <div class="big"><%= progress.getTargetHours() %> hrs</div>
            <div class="small">Daily target</div>
        </div>

    </div>

    <div class="progress-section">

        <h2>Your Progress</h2>

        <div class="progress-box">

            <strong>Progress Completion</strong>

            <div class="bar">

                <div class="fill"
                     style="width:<%= progress.getProgressPercentage() %>%;">
                    <%= progress.getProgressPercentage() %>%
                </div>

            </div>

        </div>

    </div>

    <div class="details">

        <div class="detail-card">

            <h3>🎯 Goal Details</h3>

            <div class="info">
                <span class="label">Current Goal</span>
                <span class="value">
                    <%= progress.getGoalName()==null ? "No Goal Set" : progress.getGoalName() %>
                </span>
            </div>

            <div class="info">
                <span class="label">Status</span>
                <span class="value">
                    <%= progress.getGoalStatus()==null ? "Pending" : progress.getGoalStatus() %>
                </span>
            </div>

        </div>

        <div class="detail-card">

            <h3>📊 Statistics</h3>

            <div class="info">
                <span class="label">Hours Used</span>
                <span class="value"><%= progress.getHoursUsed() %> hrs</span>
            </div>

            <div class="info">
                <span class="label">Target</span>
                <span class="value"><%= progress.getTargetHours() %> hrs</span>
            </div>

            <div class="info">
                <span class="label">Score</span>
                <span class="value"><%= progress.getScore() %>/100</span>
            </div>

            <div class="info">
                <span class="label">Progress</span>
                <span class="value"><%= progress.getProgressPercentage() %>%</span>
            </div>

        </div>

    </div>

    <div class="footer">

        <a href="dashboard.jsp" class="btn">
            ⬅ Back to Dashboard
        </a>

    </div>

</div>

</body>
</html>