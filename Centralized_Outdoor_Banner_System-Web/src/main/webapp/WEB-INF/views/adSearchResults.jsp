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
<th>Available From</th>
<th>Available Till</th>
<th>Length</th>
<th>Width</th>
<th>Price</th>
<th>Type</th>
<th>Owner</th>

</tr>
<c:forEach var="ads" items="${searchadsList}">
<tr>
           <td> <c:out value=" ${ads.availableFrom}"/><br></td>
           <td> <c:out value=" ${ads.availableTill}"/><br></td>
           <td> <c:out value=" ${ads.length}"/><br></td>
           <td> <c:out value="${ads.width}"/><br></td>
           <td> <c:out value=" ${ads.price}"/><br></td>
           <td> <c:out value=" ${ads.type}"/><br></td>
           <td> <c:out value=" ${ads.owner}"/><br></td>
           <td> <a href="/controller/bookAd?adid=${ads.ad_Id} ">Book This Ad Space</a></td>
            </tr>
        </c:forEach> 
</table>

</body>
</html>