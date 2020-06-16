<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
  <script>
              //arrow function , Lambda Expression
			  var paa=(num1,num2) => {
			      var tempa=num1+num2;
			      return tempa;
			  };
  
             //paa is variable which hold function definition
             //function expression or anonymous function
             var paa=function(num1,num2) {
            	 var tempa=num1+num2;
                 return tempa;
             };
             console.log(paa); //printing the function definition 
             var yem=paa(123,45); //calling the function definition 
             console.log(yem);
  
          //normal function
           function sum(num1,num2){
        	    var tempa=num1+num2;
        	    return tempa;
           }
           console.log(sum(12,89));
           console.log(sum(10,20));
           console.log(sum(13,30));
  
  </script>
</head>
<body>
  <h1>Hahah Hello world!!</h1>
</body>
</html>