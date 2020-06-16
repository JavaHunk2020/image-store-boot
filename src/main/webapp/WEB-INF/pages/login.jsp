<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
 <title>Login</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
  
   <script>
   
        function clearText(){
        	   //span
        	  document.getElementById("usernameError").innerHTML="";
        	  document.getElementById("passwordError").innerHTML="";
        	  document.getElementById("genMessage").innerHTML="";
        }
   
         function validateAuth() {
        	   var   usernameObj=document.getElementById("username");
        	   var  usernameText=usernameObj.value;
        	   if(usernameText.length==0){
        		     document.getElementById("usernameError").innerHTML="**Sorry username cannot be blank";
        		     usernameObj.focus();
        		     return;
        	   }

        	   var   passwordObj=document.getElementById("password");
               var  passwordText=passwordObj.value;
               if(passwordText.length==0){
            	   passwordObj.focus();
                     document.getElementById("passwordError").innerHTML="**Sorry password cannot be blank";
                     return;
               }
               //THis submitting the form
               document.authForm.submit();
        	   
         }             
   
   </script>
  
</head>
<body>
 <header style="height: 30px;background-color: #03a9f4;">
 </header>
   <div class="container">
      <br/>
     <img src="images/banner-home-middle.png" style="height: 150px;"  class="img-thumbnail">
   <img src="${pageContext.request.contextPath}/images/sleeping.png" style="height: 150px;" class="img-thumbnail">
    <img src="${pageContext.request.contextPath}/images/student.png" style="height: 150px;" class="img-thumbnail">
      <hr/>
      <span style="font-size: 18px;color: red;"  id="genMessage">${msg}</span>
      <br/>
      <div style="width: 50%">
      <form name="authForm" action="auth"  method="post">
      <label><b>Username</b></label>
      <input type="text" name="username"  id="username" class="form-control"  onkeyup="clearText();">
       <span style="color:red;font-size: 18px;"  id="usernameError"></span>
        <br/>
       <label><b>Password</b></label>
      <input type="password" name="password"  id="password"  class="form-control" onkeyup="clearText();">
        <span style="color:red;font-size: 18px;"  id="passwordError"></span>
      <br/>
      <button type="button" class="btn btn-primary"  onclick="validateAuth();">Login</button>
      <button type="reset" class="btn btn-info">Clear</button>
       <a href="${pageContext.request.contextPath}/register">
    	  <button type="button" class="btn btn-danger">Register</button>
      </a>
      
        <a href="${pageContext.request.contextPath}/forgetPass">
    	  <button type="button" class="btn btn-warning">Forgot Pass</button>
      </a>
      
       <a href="${pageContext.request.contextPath}/search">
    	  <button type="button" class="btn btn-primary">Search</button>
      </a>
      </form>
      </div>
   </div>
</body>
</html>