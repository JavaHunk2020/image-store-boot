<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
  <script>
             //paa is variable which hold function definition
             //function expression or anonymous function
             var paa=function(num1,num2) {
            	 var tempa=num1+num2;
                 return tempa;
             };
             paa(12,12);
             ajax(paa,90);
             
          //normal function
          //callback function
           function ajax(callback,num){
        	   var result=callback(num,num+10);
        	   console.log("Ahahah result is = "+result);        	    
           }
          
  </script>
</head>
<body>
  <h1>Hahah Hello world!!</h1>
</body>
</html>