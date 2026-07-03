<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ page import="dao.GoalDAO" %>
<%@ page import="model.Goal" %>
<%@ page import="model.User" %>
<%@ page import="java.util.List" %>

<%
User user = (User) session.getAttribute("user");
if(user == null){
    response.sendRedirect("login.jsp");
    return;
}

GoalDAO goalDAO = new GoalDAO();
List<Goal> goalsList = goalDAO.getGoalsByUser(user.getUserId());
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Goals</title>

<style>

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:'Segoe UI',sans-serif;
}

body{

    background:linear-gradient(135deg,#c8f7d4,#d9f5ff,#eef8d5);
    min-height:100vh;
    padding:40px;
}

/* Heading */

.heading{
    text-align:center;
    margin-bottom:35px;
}

.heading h1{
    color:#2d6a4f;
    font-size:38px;
}

.heading p{
    color:#555;
    margin-top:8px;
    font-size:17px;
}

/* Main Container */

.container{

    width:90%;
    max-width:1100px;
    margin:auto;

}

/* Card */

.card{

    background:white;
    border-radius:18px;
    padding:30px;
    box-shadow:0 10px 30px rgba(0,0,0,.12);
    margin-bottom:35px;

}

.card h2{

    color:#2d6a4f;
    margin-bottom:20px;

}

/* Inputs */

input,select{

    width:100%;
    padding:14px;
    margin-top:10px;
    margin-bottom:20px;

    border-radius:10px;
    border:1px solid #ccc;

    font-size:16px;

}

input:focus,
select:focus{

    border-color:#52b788;
    outline:none;

}

/* Buttons */

button{

    padding:12px 28px;
    border:none;
    border-radius:8px;
    cursor:pointer;
    color:white;
    font-size:15px;
    transition:.3s;

}

/* Add */

.add{

    background:#2d6a4f;

}

.add:hover{

    background:#1b4332;

}

/* Update */

.update{

    background:#2196f3;

}

.update:hover{

    background:#1565c0;

}

/* Delete */

.delete{

    background:#e53935;

}

.delete:hover{

    background:#b71c1c;

}

/* Table */

table{

    width:100%;
    border-collapse:collapse;

}

th{

    background:#2d6a4f;
    color:white;
    padding:15px;

}

td{

    padding:16px;
    text-align:center;
    border-bottom:1px solid #ddd;

}

tr:hover{

    background:#f7fff7;

}

/* Responsive */

@media(max-width:768px){

table{

display:block;
overflow-x:auto;

}

}

</style>

</head>

<body>

<div class="heading">

<h1>🌿 My Digital Detox Goals</h1>

<p>Set, Track & Complete Your Wellness Journey</p>

</div>

<div class="container">

<!-- Add Goal -->

<div class="card">

<h2>🎯 Add New Goal</h2>

<form action="GoalServlet" method="post">
<input type="hidden" name="action" value="add">

<input type="text"
name="goalName"
placeholder="Goal Name"
required>

<input type="text"
name="targetValue"
placeholder="Target Value (Example: 2 Hours)"
required>

<button class="add" type="submit">
+ Add Goal
</button>

</form>

</div>

<!-- Goal Table -->

<div class="card">

<h2>📋 Goal List</h2>

<table>

<tr>

<th>Goal Name</th>
<th>Target</th>
<th>Status</th>
<th>Update</th>
<th>Delete</th>

</tr>

<%
if(goalsList != null && !goalsList.isEmpty()){
    for(Goal g : goalsList){
%>
<tr>

<td><%= g.getGoalName() %></td>

<td><%= g.getTargetValue() %></td>

<td>

<form action="GoalServlet" method="post">
<input type="hidden" name="action" value="update">
<input type="hidden" name="goalId" value="<%= g.getGoalId() %>">

<select name="status">

<option value="Pending" <%= "Pending".equals(g.getStatus()) ? "selected" : "" %>>Pending</option>

<option value="In Progress" <%= "In Progress".equals(g.getStatus()) ? "selected" : "" %>>In Progress</option>

<option value="Completed" <%= "Completed".equals(g.getStatus()) ? "selected" : "" %>>Completed</option>

</select>

</td>

<td>

<button class="update" type="submit">
Update
</button>

</form>

</td>

<td>

<form action="GoalServlet" method="post">
<input type="hidden" name="action" value="delete">
<input type="hidden" name="goalId" value="<%= g.getGoalId() %>">

<button class="delete" type="submit">
Delete
</button>

</form>

</td>

</tr>
<%
    }
} else {
%>
<tr>
<td colspan="5" style="color: #666; font-style: italic;">No goals added yet. Set one above!</td>
</tr>
<%
}
%>

</table>

</div>

</div>

</body>
</html>