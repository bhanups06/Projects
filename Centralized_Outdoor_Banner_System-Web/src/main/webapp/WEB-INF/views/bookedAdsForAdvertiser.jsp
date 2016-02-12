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
<th>Booking Id</th>
<th>From Book Date</th>
<th>To Book Date</th>
<th>Publisher Id</th>

</tr>
<c:forEach var="ads" items="${adsListForAdvertiser}">
<tr>
           <td> <c:out value=" ${ads.bookingId}"/><br></td>
           <td> <c:out value=" ${ads.fromBookedDate}"/><br></td>
          <td>  <c:out value="${ads.tillBookedDate}"/><br></td>
           <td> <c:out value=" ${ads.publisherId}"/><br></td>
         
            </tr>
        </c:forEach> 
</table>

</body>
</html>