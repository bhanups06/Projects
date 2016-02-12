<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Change Password</title>
</head>
<body>
<form action="passwordChange" method="POST">

<table class="table table-striped">
<tr>
<td>Old Password: </td> <td><input type ="password" name="oldPassword" required="true"/></td>
</tr>
<tr>
<td>New Password: </td> <td> <input type="password" name="newPassword" required="true"/></td>
</tr>
</table><br>
<br>
<input type="submit" value="Change Password"/>
</form>
</body>
</html>