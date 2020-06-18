<%@page import="com.rab3.controller.dto.ProfileDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>Home</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
	
<style>
.zoom {
  transition: transform .2s; /* Animation */
  margin: 0 auto;
  height: 120px;
}

.zoom:hover {
  transform: scale(2.0); /* (200% zoom - Note: if the zoom is too large, it will go outside of the viewport) */
}
</style>


	<script type="text/javascript">
	
	            function saveProfle(){
	            	  var profile={};
	            	  profile.username=$("#username").val();
	            	  profile.password=$("#password").val();
	            	  profile.name=$("#name").val();
	            	  profile.email=$("#email").val();
	            	  profile.gender=$("#gender").val();
	            	  
	            	  //JavaScript Object into json
                      var jsonString= JSON.stringify(profile);
	            	  
                     const options = {
                              method: 'POST',
                              body: jsonString,
                              headers: {
                                'Content-Type': 'application/json',
                                'Accept': 'application/json'
                              }
                            };

                            var promise=fetch('api2/profiles', options);
                            promise .then(res => res.json())
                              .then(data => {
                                  console.log(data);
                                  $("#mmessage").html(data.message);
                                //closing modal
                                  $("#addProfileModal").modal("hide");
                                
                                  var content=""; 
                                  content=content+'<tr>';
                                  content=content+'  <td>'+ profile.username+'</td>';
                                  content=content+'  <td>'+ profile.name+'</td>';
                                  content=content+'  <td>'+ profile.email+'</td>';
                                  content=content+'  <td>'+ profile.gender+'</td>';
                                  content=content+'<td></td>';
                                  content=content+'<td></td>';
                                  content=content+'</tr>';
                                  $("#ttbody").append(content);
                                
                              });
	            }
	            
	
	
			    function openAddProfile(){
			        $("#addProfileModal").modal("show");
			  }
  
    	   function deleteRow(aid) {
    		          //Make Ajax call
    		         /*  {
    		        	  "aid":122,
    		        	   "appname" : "rab3tech"
    		          } */
    		          var obj={};
    		          obj.aid=aid;
    		          obj.appname="rab3tech";
    		          //JavaScript Object into json
    		           var jsonString= JSON.stringify(obj);
    		        	
    		          const options = {
    		        		   method: 'DELETE',
    		        		   body: jsonString,
    		        		   headers: {
    		        		     'Content-Type': 'application/json',
    		        		     'Accept': 'application/json'
    		        		   }
    		        		 };

    		        		 var promise=fetch('api2/dprofiles', options);
    		        		
    		        		 promise .then(res => res.json())
    		        		   .then(data => {
    		        			   console.log(data);
    		        			   $("#shankar_"+aid).hide();
    		        			   $("#mmessage").html(data.message);
    		        			
    		        		   });
    		         
	      }
	</script>
</head>
<body>
	<header style="height: 30px; background-color: #03a9f4;"> </header>
	<div class="container">
		<br /> <img src="${magic.image}" style="height: 150px;"
			class="img-thumbnail"> <img src="images/sleeping.png"
			style="height: 150px;" class="img-thumbnail"> <img
			src="images/student.png" style="height: 150px;" class="img-thumbnail">
			<a href="profiles">
			<img
			src="images/group.png" style="height: 150px;" class="img-thumbnail">
			</a>
			<span id="mmessage" style="font-size: 18px;color: red;"></span>
		<hr />
		<h4>Profiles Data</h4>
		<button type="button" class="btn btn-primary" onclick="openAddProfile();">Add Profile</button>
		<hr />
		 <table class="table table-bordered">
    <thead>
      <tr>
        <th>Username</th>
        <th>Name</th>
        <th>Email</th>
        <th>Gender</th>
        <th>Photo</th>
        <th>Action</th>
      </tr>
    </thead>
    <tbody   id="ttbody">
    
    <%
    List<ProfileDTO> profileDTOs=(List<ProfileDTO>)request.getAttribute("profileDTOs");
    for(ProfileDTO dto:profileDTOs) {
    %>
      <tr   id="shankar_<%=dto.getAid() %>">
        <td><%=dto.getUsername() %></td>
          <td><%=dto.getName() %></td>
            <td><%=dto.getEmail() %></td>
              <td><%=dto.getGender() %></td>
        <td>
        <img src="imageLoader?aid=<%=dto.getAid() %>"  class="zoom">  
        
        </td>
         <td>
        <a href="javascript:deleteRow(<%=dto.getAid() %>);">
         <img src="images/icons8-delete-100.png"  style="height: 80px;">
         </a>
         &nbsp;  &nbsp;  &nbsp;
         <a href="editProfile?aid=<%=dto.getAid() %>">
					<img src="images/edit.png" style="height: 24px;">
				</a>
         </td>
      </tr>
   <%} %>
    </tbody>
  </table>
		
		<a href="login.jsp">
			<button type="button" class="btn btn-primary">Back</button>
		</a>
	</div>
	
	
	<!-- The Modal -->
<div class="modal" id="addProfileModal">
  <div class="modal-dialog">
    <div class="modal-content">
      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">Add Profile</h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>
   <form id="addProfileForm">
      <!-- Modal body -->
      <div class="modal-body">
     
      <label>Username</label>
      <input type="text" name="username"  id="username"  class="form-control">
       <label>Password</label>
      <input type="password" name="password"  id="password"  class="form-control">
         
        <label>Name</label>
      <input type="text" name="name"  id="name" class="form-control">
      
      <label>Email</label>
      <input type="email" name="email"  id="email" class="form-control">
      <label>Gender</label>
      <select  name="gender"  class="form-control" style="width: 50%;"  id="gender">
         <option>Male</option>
         <option>Female</option>
      </select>
      <br/>
      </div>
      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" onclick="saveProfle();">Save</button>
      </div>
 </form>
    </div>
  </div>
</div>
</body>
</html>