<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ page import="java.util.List"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AI Suggestions</title>

<style>

*{
margin:0;
padding:0;
box-sizing:border-box;
font-family:'Segoe UI',sans-serif;
}

body{

background:linear-gradient(135deg,#dff7e5,#f6fffa);

display:flex;
justify-content:center;
align-items:center;

min-height:100vh;

}

.container{

width:900px;

background:white;

padding:40px;

border-radius:20px;

box-shadow:0 15px 35px rgba(0,0,0,.15);

}

h1{

text-align:center;

color:#2E8B57;

margin-bottom:10px;

}

.subtitle{

text-align:center;

color:#666;

margin-bottom:35px;

}

.card{

background:#f8fffb;

border-left:6px solid #2E8B57;

padding:18px;

margin-bottom:18px;

border-radius:10px;

transition:.3s;

}

.card:hover{

transform:translateX(8px);

box-shadow:0 8px 15px rgba(0,0,0,.08);

}

.card h3{

color:#2E8B57;

margin-bottom:8px;

}

.card p{

color:#555;

line-height:24px;

}

.btn{

margin-top:30px;

display:block;

width:250px;

margin-left:auto;

margin-right:auto;

text-align:center;

padding:15px;

background:#2E8B57;

color:white;

text-decoration:none;

border-radius:10px;

font-size:17px;

}

.btn:hover{

background:#246b45;

}

</style>

</head>

<body>

<div class="container">

<h1>🌿 AI Digital Detox Suggestions</h1>

<p class="subtitle">
Based on your screen-time analysis, here are your personalized recommendations.
</p>

<%

List<String> suggestions=(List<String>)request.getAttribute("suggestions");

if(suggestions!=null){

for(String s : suggestions){

%>

<div class="card">

<h3>✔ Recommendation</h3>

<p><%=s%></p>

</div>

<%

}

}else{

%>

<div class="card">

<h3>No Suggestions</h3>

<p>No recommendations available.</p>

</div>

<%

}

%>

<a href="dashboard.jsp" class="btn">

Go to Dashboard →

</a>

</div>

</body>
</html>