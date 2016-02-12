<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Search</title>
<script>
$('#msg_form').submit(function (e) {
    e.preventDefault();

$.ajax({             
type: 'post',
url: '/controller/searchBanner',
data: $('#msg_form').serialize(),
success: function (data) {
 /* alert('form was submitted'); */
	$("#test").html(data);
}
    });

    return false;
});


</script>
</head>
<body>

<form action="searchBanner" method="post" id ="msg_form">
<input type="text" name = "location" id ="location"/>
<input type ="submit" value="search"/>
<table class="table table-striped">
<tr>
<th>Advertisement Id</th>
<th>Length</th>
<th>Height</th>
<th>Type</th>
<th>Available From</th>
<th>Available Till</th>
<th>Owner</th>
</tr>
<c:forEach var="ad" items="${searchadsList}">
       <tr>
           <td> <c:out value=" ${ad.advertisementId}"/><br></td>
           <td> <c:out value=" ${ad.length}"/><br></td>
           <td> <c:out value=" ${ad.width}"/><br></td>
           <td> <c:out value=" ${ad.type}"/><br></td>
           <td> <c:out value=" ${ad.availableFrom}"/><br></td>
           <td> <c:out value=" ${ad.availableTill}"/><br></td>
           <td> <c:out value=" ${ad.owner}"/><br></td>
           <td> <a href="/controller/viewAd?adid=${ad.advertisementId} ">View Ad</a></td>
       </tr>
</c:forEach> 
</table>
</form>
</body>
</html>