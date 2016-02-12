<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="springForm"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<script>
function checkInput() 
{
if(document.adForm.availableFrom.value >= document.adForm.availableTill.value )
{
  alert("Available From Date should be after Available Till date");
  return false;  
}
}
</script>

<title>Add Advertisement Page</title>
<style>
.error {
	color: #ff0000;
	font-style: italic;
	font-weight: bold;
}

$( "#datepicker" ).datepicker({
 
});
</style>
</head>
<body>
	<springForm:form name ="adForm" method="POST" commandName="advertisements" action="add" onsubmit ="return checkInput()">
		<table class="table">
			<tr>
				<td>Length:</td>
				<td><springForm:input type="text" pattern="[1-9][0-9]*" path="length" title="Kindly input numbers" required="true" /></td>
				<td><springForm:errors path="length" cssClass="error" /></td>
			</tr>
			<tr>
				<td>Width:</td>
				<td><springForm:input type="text" pattern="[1-9][0-9]*" path="width" title="Kindly input numbers" required="true"/></td>
				<td><springForm:errors path="width" cssClass="error" /></td>
			</tr>
			<tr>
				<td>Location:</td>
				<td><springForm:input path="location" pattern="[a-zA-Z]*" title="Kindly provide a valid location" required="true"/></td>
				<td><springForm:errors path="location" cssClass="error" /></td>
			</tr>

			<tr>
				<td>Price:</td>
				<td><springForm:input type="type" pattern="[1-9][0-9]*"  path="price" title="Kindly input numbers" required="true"/></td>
				<td><springForm:errors path="price" cssClass="error" /></td>
			</tr>

			<tr>
		
			<tr>
				<td>Type:</td>
				<td><springForm:select path="type">
						<springForm:option value="" label="LED Board" />
						<springForm:option selected="selected" value="Banner" label="Banner" />
						<springForm:option value="Electronics" label="Electronics" />
						<springForm:option value="Restaurants" label="Restaurants" />
						<springForm:option value="Food" label="Food" />
					</springForm:select></td>
				<td><springForm:errors path="type" cssClass="error" /></td>
			</tr>
			<tr>
				<td>Available From:</td>
				<td><springForm:input type="text" path="availableFrom"
						id="datepicker" placeholder="MM/dd/yyyy" required="true" /></td>
				<td><springForm:errors path="availableFrom" cssClass="error" /></td>
			</tr>
			<tr>
				<td>AvailableTill:</td>
				<td><springForm:input type="text" path="availableTill"
						id="datepicker" placeholder="MM/dd/yyyy" required="true" /></td>
				<td><springForm:errors path="availableTill" cssClass="error" /></td>
			</tr>
			<tr>
				<td colspan="3"><input class="btn btn-info" type="submit" value="Add Advertisement" onclick="checkInput();"></td>
			</tr>
		</table>
	</springForm:form>
</body>
</html>