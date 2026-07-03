<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Screen Time Tracker</title>

<style>

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:'Segoe UI',sans-serif;
}

body{
    margin:0;
    font-family:'Segoe UI',sans-serif;
    background:url("images/screentimebg.jpg") no-repeat center center/cover;
    display:flex;
    justify-content:center;
    align-items:center;
    height:100vh;
}

body::before{
    content:"";
    position:fixed;
    top:0;
    left:0;
    width:100%;
    height:100%;
    background:rgba(0,0,0,0.35);
}

.container{
    position:relative;
    z-index:1;
    width:420px;
    padding:35px;
    background:rgba(255,255,255,0.92);
    border-radius:20px;
    box-shadow:0 10px 35px rgba(0,0,0,0.3);
}

h1{
    text-align:center;
    color:#2e7d32;
}

p{
    text-align:center;
    color:#555;
    margin-bottom:25px;
}

.input-group{
    margin-bottom:18px;
}

label{
    display:block;
    margin-bottom:8px;
    font-weight:600;
}

input{
    width:100%;
    padding:12px;
    border-radius:10px;
    border:1px solid #ccc;
    font-size:15px;
}

input:focus{
    outline:none;
    border-color:#43a047;
    box-shadow:0 0 8px rgba(67,160,71,0.3);
}

button{
    width:100%;
    padding:14px;
    background:#43a047;
    color:white;
    border:none;
    border-radius:10px;
    font-size:16px;
    cursor:pointer;
    transition:0.3s;
}

button:hover{
    background:#2e7d32;
}

</style>
</head>

<body>

<div class="container">

<h1>📱 Screen Time Tracker</h1>

<p>Track your daily digital habits</p>

<form action="ScreenTimeServlet" method="post">

<div class="input-group">
<label>📅 Usage Date</label>
<input type="date" name="usageDate" required>
</div>

<div class="input-group">
<label>⏱ Total Screen Time (Hours)</label>
<input type="number" step="0.1" name="totalHours" required>
</div>

<div class="input-group">
<label>💬 Social Media</label>
<input type="number" step="0.1" name="socialMediaHours" required>
</div>

<div class="input-group">
<label>🎮 Gaming</label>
<input type="number" step="0.1" name="gamingHours" required>
</div>

<div class="input-group">
<label>🎬 Entertainment</label>
<input type="number" step="0.1" name="entertainmentHours" required>
</div>

<button type="submit">Save Screen Time</button>

</form>

</div>

</body>
</html>