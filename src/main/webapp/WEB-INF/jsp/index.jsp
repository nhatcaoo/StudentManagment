<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 
<!DOCTYPE HTML>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Person List</title>
   <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css"/>
  </head>
  <body>
    <h1>Person List</h1>
    
    <br/><br/>
    <div>
      <table border="1">
        <tr>
          <th>Student Code</th>
            <th>Name</th>
            <th>Dob</th>
              <th>${nambeo.getStudentName}</th>
        </tr>
        <c:forEach  items="${students}" var ="student">
        <tr>
        <td>${nambeo.getStudentName}</td>
          <td>${student.studentCode}</td>
           <td>${student.studentName}</td>
            <td>${student.dob}</td>
             <td>${student.studentCode}</td>
        </tr>
        </c:forEach>
      </table>
    </div>
  </body>
  
</html>