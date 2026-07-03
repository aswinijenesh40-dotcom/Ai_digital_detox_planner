<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Reset Password</title>
</head>
<body>

<h2>Reset Password</h2>

<p>Enter your new password</p>

<form action="ResetPasswordServlet" method="post">

    <input type="hidden"
           name="email"
           value="<%=request.getAttribute("email")%>">

    <div class="input-group">
        <label>New Password</label>
        <input type="password"
               name="password"
               placeholder="Enter New Password"
               required>
    </div>

    <br>

    <button type="submit" class="btn">
        Update Password
    </button>

</form>

<br>

<a href="login.jsp">← Back to Login</a>

</body>
</html>