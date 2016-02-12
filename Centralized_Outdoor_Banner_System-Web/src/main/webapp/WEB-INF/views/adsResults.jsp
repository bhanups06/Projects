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
<th>Owner</th>
<th>Ad Type</th>
<th>Location</th>
<th>Status</th>
<th>Price</th>
<th>Ad_Id</th>
<th>Activate</th>
</tr>
<c:forEach var="ads" items="${adsList}">
<tr>
           <td> <c:out value=" ${ads.owner}"/><br></td>
           <td> <c:out value=" ${ads.type}"/><br></td>
          <td>  <c:out value="${ads.location}"/><br></td>
           <td> <c:out value=" ${ads.status}"/><br></td>
           <td> <c:out value=" ${ads.price}"/><br></td>
           <td> <c:out value=" ${ads.advertisementId}"/><br></td>
           <td> <a href="/controller/activateAd?adid=${ads.advertisementId} ">Activate Ad</a></td>
            <br>
            </tr>
        </c:forEach> 
</table>

</body>
</html>