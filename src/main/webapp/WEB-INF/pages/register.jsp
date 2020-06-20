<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
 <title>Register</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
  
   <script type="text/javascript">
   
      function polulateSalutations(){
    	       var  gender=$("#gender").val();
    	       if(gender.length==0){
    	    	   $("#mmessage").html("Please select a gender!!!");
    	    	   $("#mmessage").focus();
    	    	   return;
    	       }
    	       $("#mmessage").html("");
    	       
    	       var promise=fetch("api2/profiles/salutations/"+gender);
    	         promise.then((resp) => resp.json()) // Transform the data into json
    	        .then(function(data) { //JavaScript from JSON
    	             console.log(data);  
    	             $('#salutation'). empty();
    	             for (index = 0; index < data.length; index++) { 
    	                 $('#salutation').append( $('<option></option>').val(data[index]).html(data[index])  ); 
    	             } 
    	        });
    	       
      }
   
      $(document).ready(function(){
    	            //Make ajax call
    	  //This is AJAX call to communicate with rest API or controller
    	  http://localhost:8080/
          var promise=fetch("api2/profiles/choices");
         promise.then((resp) => resp.json()) // Transform the data into json
        .then(function(data) { //JavaScript from JSON
             console.log(data);  //data={"email":"93939"}
             $('#gender').append( $('<option></option>').val('').html('Select') ); 
             for (index = 0; index < data.length; index++) { 
                 $('#gender').append( $('<option></option>').val(data[index]).html(data[index])  ); 
             } 
             
        });
    	        	  
    	  
    	  
      });
   
   </script>
  
</head>
<body>
 <header style="height: 30px;background-color: #03a9f4;">
 </header>
   <div class="container">
      <br/>
     <img src="images/register.png" style="height: 150px;"  class="img-thumbnail">
   <img src="images/sleeping.png" style="height: 150px;" class="img-thumbnail">
    <img src="images/student.png" style="height: 150px;" class="img-thumbnail">
      <hr/>
      <span style="font-size: 18px;color: red;"  id="mmessage">${msg}</span>
      <br/>
      <div style="width: 50%">
      <form action="register" method="post" enctype="multipart/form-data">
      <label>Username</label>
      <input type="text" name="username"  class="form-control">
       <label>Password</label>
      <input type="password" name="password"  class="form-control">
         
        <label>Name</label>
      <input type="text" name="name"  class="form-control">
      
      <label>Email</label>
      <input type="email" name="email"  class="form-control">
      <label>Gender</label>
      <div style="width: 100%">
      <table style="width: 100%">
      <tr>
      <td style="width: 50%;">
      <select  name="gender" id="gender"  class="form-control"  onchange="polulateSalutations();">
      </select>
      </td>
      <td style="width: 50%;">
     <select  name="salutation" id="salutation"  class="form-control" >
           <option value="">Select</option>
      </select>
      </td>
      </tr>
      </table>
      </div>
        <label>Image</label>
      <input type="file" name="photo"  class="form-control" style="background-color: #fadbff;">
      
      <br/>
      <button type="submit" class="btn btn-primary">Register</button>
      <button type="reset" class="btn btn-info">Clear</button>
       <a href="login.jsp">
      <button type="button" class="btn btn-danger">Login</button>
      </a>
      </form>
      </div>
   </div>
</body>
</html>