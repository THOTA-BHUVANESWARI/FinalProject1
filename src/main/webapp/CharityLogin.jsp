<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Charity Login</title>
<style>
body {
    font-family: Arial, sans-serif;
    background-color: #f8f9fa;
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
}
.container {
    background: white;
    padding: 30px;
    border-radius: 10px;
    box-shadow: 0 4px 15px rgba(0,0,0,0.2);
    width: 350px;
    text-align: center;
}
input {
    width: 90%;
    padding: 10px;
    margin: 10px 0;
    border: 1px solid #ccc;
    border-radius: 5px;
}
button {
    width: 95%;
    padding: 10px;
    background-color: #0d6efd;
    border: none;
    color: white;
    border-radius: 5px;
    cursor: pointer;
}
button:hover {
    background-color: #0b5ed7;
}
a {
    color: #0d6efd;
    text-decoration: none;
}
</style>
</head>
<body>
<div class="container">
    <h2>Charity Login</h2>
    <form action="loginCharity" method="post">
        <input type="text" name="regno" placeholder="Registration Number" required><br>
        <input type="text" name="phone" placeholder="Phone Number" required><br>
        <button type="submit">Login</button>
    </form>
    <p>New charity? <a href="addCharity.jsp">Register here</a></p>
</div>
</body>
</html>
