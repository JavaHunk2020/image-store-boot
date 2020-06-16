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
           
             let result=ajax(function(num1,num2) {
                 var tempa=num1+num2;
                 return tempa;
             },function(num1,num2) {
                 var tempa=num1-num2;
                 return tempa;
             },90,10);
             
             console.log("Result is  = "+result);
             
          //normal function
          //callback function
           function ajax(callback1,callback2,num1,num2){
        	   var result1=callback1(num1,num2);
        	   var result2=callback2(num1,num2);
        	   console.log("Ahahah result is = "+(result1+result2));
        	   return result1+result2;
           }
          
  </script>
</head>
<body>
  <h1>Hahah Hello world!!</h1>
</body>
</html>