<%@ page language="java"
    import="com.src.service.*, java.util.List, com.src.model.*"
    contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Donor Login & Registration</title>
<style>
body { font-family: Arial; margin: 0; padding: 0; }
#overlay { position: fixed; top: 0; left: 0; width:100%; height:100%;
  background: rgba(0,0,0,0.6); display:flex; justify-content:center; align-items:center; z-index:1000; }
.modal { background:white; padding:25px; border-radius:10px; width:350px; text-align:center; }
.modal input { width:90%; padding:10px; margin:10px 0; border-radius:5px; border:1px solid #ccc; }
button { padding:10px 20px; border:none; border-radius:5px; cursor:pointer; }
.login-btn { background-color:#0d6efd; color:white; }
.register-btn { background-color:#28a745; color:white; }
</style>
<script>
function showRegister(){ document.getElementById("loginForm").style.display="none"; document.getElementById("registerForm").style.display="block"; }
function showLogin(){ document.getElementById("loginForm").style.display="block"; document.getElementById("registerForm").style.display="none"; }
function validateLogin(){ return document.getElementById("loginEmail").value && document.getElementById("loginPhone").value; }
function validateRegister(){ return document.getElementById("regName").value && document.getElementById("regEmail").value && document.getElementById("regPhone").value; }
</script>
</head>
<body>

<div id="overlay">
    <!-- LOGIN FORM -->
    <div class="modal" id="loginForm">
        <h2>Donor Login</h2>
        <form action="loginDonor" method="post" onsubmit="return validateLogin()">
            <input type="email" name="email" id="loginEmail" placeholder="Email"><br>
            <input type="tel" name="phone" id="loginPhone" placeholder="Phone"><br>
            <button type="submit" class="login-btn">Login</button>
        </form>
        <p>New Donor? <a href="javascript:void(0)" onclick="showRegister()">Register</a></p>
    </div>

    <!-- REGISTER FORM -->
    <div class="modal" id="registerForm" style="display:none;">
        <h2>Register Donor</h2>
        <form action="addDonor" method="post" onsubmit="return validateRegister()">
            <input type="text" name="name" id="regName" placeholder="Full Name"><br>
            <input type="email" name="email" id="regEmail" placeholder="Email"><br>
            <input type="tel" name="phone" id="regPhone" placeholder="Phone"><br>
            <input type="text" name="address" placeholder="Address"><br>
            <button type="submit" class="register-btn">Register</button>
        </form>
        <p>Already Registered? <a href="javascript:void(0)" onclick="showLogin()">Login</a></p>
    </div>
</div>
</body>
</html>
