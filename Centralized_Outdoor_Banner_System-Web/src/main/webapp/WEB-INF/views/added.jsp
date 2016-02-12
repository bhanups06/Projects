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
<table class="table">
<tr>
<th>Ad Id</th>
<th>Length</th>
<th>Width</th>
<th>Type</th>
<th>Available From</th>
<th>Location</th>
<th>Booked By</th>
</tr>
<c:forEach var="user" items="${adList}">
<tr>
           <td> <c:out value=" ${user.advertisementId}"/><br></td>
           <td> <c:out value=" ${user.length}"/><br></td>
          <td>  <c:out value="${user.width}"/><br></td>
           <td> <c:out value=" ${user.type}"/><br></td>
          <td> <c:out value=" ${user.availableFrom}"/><br></td>
         <td> <c:out value=" ${user.location}"/><br></td>
         <td> <c:out value=" ${user.bookedBy}"/><br></td>
            </tr>
        </c:forEach> 
</table>

</body>
</html>