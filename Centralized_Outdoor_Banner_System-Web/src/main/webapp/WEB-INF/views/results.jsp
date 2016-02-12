<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<table class="table table-striped">
<tr>
<th>Name:</th>
<th>Username:</th>
<th>Type</th>
<th>Status</th>
<th>EmailId</th>
<th>Contact Number</th>
<th>Activate Here</th>
</tr>
<c:forEach var="user" items="${userList}">
<tr>
           <td> <c:out value=" ${user.name}"/><br></td>
           <td> <c:out value=" ${user.userName}"/><br></td>
          <td>  <c:out value="${user.type}"/><br></td>
           <td> <c:out value=" ${user.registrationStatus}"/><br></td>
           <td> <c:out value=" ${user.emailId}"/><br></td>
           <td> <c:out value=" ${user.contactNumber}"/><br></td>
           <td> <a href="/controller/activate?userid=${user.userName} ">Activate User</a></td>
            <br>
            </tr>
        </c:forEach> 
</table>

</body>
</html>