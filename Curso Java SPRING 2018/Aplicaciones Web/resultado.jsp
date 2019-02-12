<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page errorPage="error.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<c:choose>
		<c:when test="${empty lista}">
			No hay personas
		</c:when>
		<c:otherwise>
			<table>
				<tr>
					<td>dni</td>
					<td>nombre</td>
					<td>edad</td>
				<tr>
				<c:forEach items="${lista}" var="p">
					<tr>
						<td>${p.dni}</td>
						<td>${p.nombre}</td>
						<td>${p.edad}</td>
					</tr>
				</c:forEach>
			</table>
		</c:otherwise>
	</c:choose>
</body>
</html>