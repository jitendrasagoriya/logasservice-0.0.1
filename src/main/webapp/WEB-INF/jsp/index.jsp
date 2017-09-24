<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home - Tomcat Log</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
</head>
<body>
	
	<div class="container">
	
	<h4>Log As A Service</h4>
		<form class="form-inline">
		  <table width="100%" >
		  	<tr>
		  		<td> <label> File Name</label> </td>
		  		<td> <select class="form-control" style="width:250px" id="fileName" >
		  				<option> Please Select</option>
						<option> catalina </option>
						<option>localhost </option>
						<option>manager </option>
						<option>tomcat9-stderr </option>
						<option>commons-daemon </option>
						<option>tomcat9-stdout </option>
						<option>localhost_access_log </option>
						<option>host-manager</option>
		  			</select> 
		  		</td>
				
		  		
		  	</tr>
			
			 <tr>
			 <td> <label> Select date</label> </td>
				<td style="float:left;padding: 30px 0;">
					<input style="width:250px"  class="form-control"  type="date" id="logDate"/>
				</td>
				<td>
					<div class="form-group" style="float:center;">
		  			 
					  <input type="button" class="btn btn-primary" onclick="getLog()" value="Get Log"/>
					  
					   <input type="button" class="btn btn-primary" onclick="getLog()" value="Update Log"/>
					 </div>
		  		</td>
			 </td>
			 <script>
				var today = new Date();
				var dd = today.getDate();
				var mm = today.getMonth()+1; //January is 0!
				var yyyy = today.getFullYear();
				 if(dd<10){
						dd='0'+dd
					} 
					if(mm<10){
						mm='0'+mm
					} 

				today = yyyy+'-'+mm+'-'+dd;
				document.getElementById("logDate").setAttribute("max", today);
				document.getElementById("logDate").value= today;
			 </script>
			
			<tr>
				<td colspan="3" style="padding: 10px 0;">
				Default path :
					<b id="base">C:\Program Files (x86)\Apache Software Foundation\Tomcat 9.0\logs\</b>
					<a href="#" onclick="show()">
						<img src="build/resources/main/img/setting.gif" width="20px" height="20px" ></img>
					</a>
				</td>
			</tr>
			
			<tr id="fileLocation" style="display: none">
				<td colspan="3" style="padding: 10px 0;">
				Select path :
					<input type="file" id="location"  webkitdirectory="" multiple=""/>
					<a href="#" onclick="alert('hello')">
						<input type="button" class="btn btn-primary" onclick="setPath()" value="Set filr path"/>
					</a>
				</td>
			</tr>
			<script>
			 	 function show(){
					 $("#fileLocation").toggle();
				 }
				 
				 function setPath(){
					 $("#fileLocation").text( $("#location").val() );
					 $("#fileLocation").hide();
				 }
			</script>
			<tr>
				<td colspan="3" style="padding: 10px 0;">
				<div>Output</div>
				
					<textarea class="form-control" rows="20" cols="150" id="result"></textarea>
				</td>
			</tr>
		  	 
		  </table>
		</form>
	</div>
	
	
	
	<script>
	
	function getLog(){
			var url = "http://localhost:9292/api/log/read/"+$("#fileName").val()+"/"+$("#logDate").val();
			 
		  // Send the data using post
		  var posting = $.post( url,{ base: $("#base").text() },function(result){	
			  if(result.errorCode == 200){
				   	$("#result").val(result.data);
			  }else if(result.errorCode == 500){
				   	$("#result").val(result.errorMessage);
			  }
		    } );	 
		  
	  }
	
	
	</script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</body>
</html>