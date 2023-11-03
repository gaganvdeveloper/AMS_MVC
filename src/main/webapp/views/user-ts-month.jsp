<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:if test="${not empty monthtimeSheet}">
		<p>
			TimeSheet of Month <Strong>${ month} </Strong>and Year:<Strong>${year}
			</Strong>
		</p>
	</c:if>
	<c:if test="${ empty monthtimeSheet}">
		<p>
			TimeSheet of Month <Strong>${ month} </Strong>and Year:<Strong>${year}
				was not existed </Strong>
		</p>
	</c:if>


	<table border="2" cellpadding="10" cellmargin="15">
		<tr>
			<th>S.No</th>
			<th>Started Date</th>
			<th>Ended Date</th>
			<th>AttendenceDetails</th>
		</tr>

		<tr>
			<c:if test="${monthtimeSheet.getTimesheetId()!= null}">
				<td>${monthtimeSheet.getTimesheetId() }</td>
				<td>${monthtimeSheet.getStart_date() }</td>
				<td>${monthtimeSheet.getEnd_date() }</td>
				<c:if test="${monthtimeSheet.getTimesheetId()!= null}">
					<td><a href="#">attendance</a></td>
				</c:if>
			</c:if>
		</tr>
	</table>

</body>
</html>