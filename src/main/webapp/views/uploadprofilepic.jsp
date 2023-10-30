<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Upload Profile Picture</title>
</head>
<body>
	<form action="uploadprofilepic?id=${user1.getUserId() }" enctype="multipart/form-data" method="post" >
		<input type="file" name="file" id="file" accept="image/*" >
		<button type="submit">Upload</button>
	</form>
</body>
</html>