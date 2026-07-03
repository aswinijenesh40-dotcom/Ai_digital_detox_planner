<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ page import="model.DashboardData"%>
<%@ page import="model.User"%>

<%
User user = (User) session.getAttribute("user");

if(user == null){
    response.sendRedirect("login.jsp");
    return;
}

DashboardData dashboard = (DashboardData) request.getAttribute("dashboard");

double screenTime = 0.0;
double targetHours = 0.0;
int focusScore = 0;
String goalStatus = "No Goal";
String goalName = "No Goal Created";
String userName = user.getName();

if(dashboard != null){

    if(dashboard.getUserName()!=null)
        userName = dashboard.getUserName();

    screenTime = dashboard.getScreenTime();
    targetHours = dashboard.getTargetHours();
    focusScore = dashboard.getFocusScore();

    if(dashboard.getGoalStatus()!=null)
        goalStatus = dashboard.getGoalStatus();

    if(dashboard.getGoalName()!=null)
        goalName = dashboard.getGoalName();
}

int progress = 0;

if(targetHours > 0){

    progress = (int)((Math.min(screenTime,targetHours)/targetHours)*100);

    if(progress > 100){
        progress = 100;
    }

}
%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>Dashboard | AI Digital Detox Planner</title>

<style>

*{
margin:0;
padding:0;
box-sizing:border-box;
font-family:Segoe UI,sans-serif;
}

body{
background:#edf3fb;
display:flex;
min-height:100vh;
}

/* Sidebar */

.sidebar{

width:260px;
background:linear-gradient(180deg,#2E7D32,#1B5E20);
color:white;
position:fixed;
left:0;
top:0;
height:100%;
padding:30px 20px;

}

.logo{

font-size:40px;
text-align:center;

}

.logo h2{

margin-top:10px;
font-size:38px;
line-height:50px;

}

.sidebar a{

display:block;
color:white;
text-decoration:none;
padding:15px;
margin-top:15px;
border-radius:10px;
font-size:18px;
transition:.3s;

}

.sidebar a:hover{

background:rgba(255,255,255,.25);

}

/* Main */

.main{

margin-left:260px;
width:calc(100% - 260px);
padding:40px;

}

/* Welcome */

.header{

background:white;
padding:30px;
border-radius:20px;
box-shadow:0 8px 20px rgba(0,0,0,.08);
margin-bottom:30px;

}

.header h1{

font-size:42px;
color:#2563eb;

}

.header p{

margin-top:12px;
font-size:20px;
color:#666;

}

/* Cards */

.cards{

display:grid;
grid-template-columns:repeat(3,1fr);
gap:25px;
margin-bottom:30px;

}

.card{

background:white;
padding:35px;
border-radius:20px;
text-align:center;
box-shadow:0 8px 20px rgba(0,0,0,.08);
transition:.3s;

}

.card:hover{

transform:translateY(-6px);

}

.card h2{

font-size:55px;
color:#2563eb;

}

.card p{

margin-top:15px;
font-size:22px;
color:#666;

}

/* Goal */

.goal{

background:white;
padding:35px;
border-radius:20px;
box-shadow:0 8px 20px rgba(0,0,0,.08);
margin-bottom:30px;

}

.goal h2{

color:#2563eb;
font-size:38px;
margin-bottom:20px;

}

.progress{

margin-top:25px;
width:100%;
height:22px;
background:#ddd;
border-radius:30px;
overflow:hidden;

}

.progress-bar{

height:100%;
width:<%=progress%>%;
background:linear-gradient(90deg,#4CAF50,#00C853);

}

/* Suggestions */

.suggestions{

background:white;
padding:35px;
border-radius:20px;
box-shadow:0 8px 20px rgba(0,0,0,.08);

}

.suggestions h2{

color:#2563eb;
font-size:36px;
margin-bottom:20px;

}

.suggestions li{

margin-bottom:15px;
font-size:20px;

}

.footer{

text-align:center;
margin-top:40px;
color:#777;

}

@media(max-width:900px){

.cards{

grid-template-columns:1fr;

}

.sidebar{

width:100%;
height:auto;
position:relative;

}

.main{

margin-left:0;
width:100%;

}

}

</style>

</head>

<body>

<div class="sidebar">

<div class="logo">

🌿

<h2>Detox<br>Planner</h2>

</div>

<a href="DashboardServlet">🏠 Dashboard</a>

<a href="planner.jsp">📝 Create Detox Plan</a>

<a href="progress.jsp">📈 View Progress</a>

<a href="goal.jsp">🎯 Goals</a>

<a href="profile.jsp">👤 My Profile</a>

<a href="logout.jsp">🚪 Logout</a>

</div>

<div class="main">
<!-- Welcome Card -->

<div class="header">

    <h1>
        Welcome, <%= userName %> 👋
    </h1>

    <p>
        Track your digital wellness and stay productive every day.
    </p>

</div>

<!-- Dashboard Cards -->

<div class="cards">

    <div class="card">

        <h2><%= screenTime %></h2>

        <p>Today's Screen Time (Hours)</p>

    </div>

    <div class="card">

        <h2><%= focusScore %>%</h2>

        <p>Focus Score</p>

    </div>

    <div class="card">

        <h2><%= goalStatus %></h2>

        <p>Goal Status</p>

    </div>

</div>

<!-- Today's Goal -->

<div class="goal">

    <h2>🎯 Today's Goal</h2>

    <% if(dashboard != null && targetHours > 0){ %>

        <h3 style="margin-top:15px; color:#333;">
            <%= goalName %>
        </h3>

        <br>

        <p style="font-size:20px;">

            Target Screen Time :

            <strong style="color:#2E7D32;">
                <%= targetHours %> Hours
            </strong>

        </p>

        <br>

        <div class="progress">

            <div class="progress-bar"></div>

        </div>

        <br>

        <p style="font-size:18px;">

            Progress :

            <strong><%= progress %>%</strong>

        </p>

    <% } else { %>

        <p style="font-size:18px;">

            No detox plan has been created yet.

        </p>

        <br>

        <div class="progress">

            <div class="progress-bar" style="width:0%;"></div>

        </div>

    <% } %>

</div>
<!-- AI Suggestions -->

<div class="suggestions">

    <h2>🤖 AI Suggestions</h2>

    <ul>

    <% if(dashboard != null){ %>

        <% if(screenTime > targetHours && targetHours > 0){ %>

            <li>📱 Your screen time is above today's target. Try reducing unnecessary mobile usage.</li>

        <% } else { %>

            <li>🎉 Great job! You are within your target screen time.</li>

        <% } %>

        <% if(focusScore < 50){ %>

            <li>🎯 Your focus score is low. Try using the Pomodoro Technique.</li>

        <% } else if(focusScore < 80){ %>

            <li>👍 Good work! Stay consistent and take short breaks.</li>

        <% } else { %>

            <li>🏆 Excellent! Your focus score is outstanding.</li>

        <% } %>

        <li>☕ Take a 10-minute break after every hour of screen time.</li>

        <li>📖 Read a book for at least 30 minutes today.</li>

        <li>🚶 Go for a short walk in the evening.</li>

        <li>💧 Drink enough water throughout the day.</li>

        <li>😴 Avoid using your phone before bedtime.</li>

    <% } else { %>

        <li>Create your first detox plan to receive personalized AI suggestions.</li>

    <% } %>

    </ul>

</div>

<!-- Footer -->

<div class="footer">

    <hr style="margin:35px 0;">

    <h2 style="color:#2E7D32;">🌿 AI Digital Detox Planner</h2>

    <br>

    <p style="font-size:18px;">
        Logged in as:
        <strong><%= userName %></strong>
    </p>

    <br>

    <table style="margin:auto;border-collapse:collapse;width:70%;">

        <tr style="background:#2E7D32;color:white;">
            <th style="padding:12px;">Today's Screen Time</th>
            <th style="padding:12px;">Focus Score</th>
            <th style="padding:12px;">Goal Status</th>
        </tr>

        <tr style="background:white;">

            <td style="padding:12px;text-align:center;">
                <%= screenTime %> Hours
            </td>

            <td style="padding:12px;text-align:center;">
                <%= focusScore %>%
            </td>

            <td style="padding:12px;text-align:center;">
                <%= goalStatus %>
            </td>

        </tr>

    </table>

    <br><br>

    <p style="color:#888;">
        © 2026 AI Digital Detox Planner
            </p>

</div>

</div>

</body>

</html>