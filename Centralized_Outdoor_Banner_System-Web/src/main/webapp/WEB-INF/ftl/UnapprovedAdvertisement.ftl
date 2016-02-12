<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Booking History</title>
</head>
<body>
<table class="table table-striped">
<tr>
<th>Advertisement Id</th>
<th>Length</th>
<th>Width</th>
<th>Type</th>
<th>Price</th>
<th>Location</th>
<th>Owner</th>
<th>Subscribed From</th>
<th>Subscribed Till</th>
<th>Approval Required</th>
</tr>   
    <#list model["adsList"] as ad>     
    <tr>
        <td>${ad.advertisementId}<br></td>
        <td>${ad.length}<br></td>
        <td>${ad.width}<br></td>
        <td>${ad.type}<br></td>
        <td>${ad.price}<br></td>
        <td>${ad.location}<br></td>
        <td>${ad.owner}</td>
        <td>${ad.availableFrom}<br></td>
        <td>${ad.availableTill}<br></td>
        <td><a href="/controller/activateAd?adid=${ad.advertisementId} ">Activate Ad</a></td>
    </tr>   
     </#list>
  </table> 
</body>
</html>