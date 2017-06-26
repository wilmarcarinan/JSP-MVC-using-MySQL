<%-- 
Document   : listUser
Created on : Jun 26, 2017, 11:15:32 AM
Author     : Wilmar Paul
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Employee List</title>
	<link rel="stylesheet" href="css/style.css" type="text/css">
	<link rel="stylesheet" href="css/jquery-ui.css" type="text/css">
	<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
	<script type="text/javascript" src="js/script.js"></script>
	<script type="text/javascript" src="js/jquery-ui.min.js"></script>
</head>
<body>
	<div class="container">
		<center>
			<h4>
				Employees list
			</h4>
		</center>
		<div>
			<p><b>Search Option</b></p>
			<form method="GET" action="ListEmployee">
				<input type="hidden" name="action" value="search">
				<div>
					<label>First Name</label>
					<input type="text" id="FirstName" name="FirstName">
				</div>

				<div>
					<label>Last Name</label>
					<input type="text" id="LastName" name="LastName">
				</div>

				<div>
					<label>Email</label>
					<input type="email" id="Email" name="Email">
				</div>

				<div>
					<label>Hire Date</label>
					<input type="text" id="HireDate" name="HireDate">~<input type="text" id="HireDate2" name="HireDate2">
				</div>
				<div>
					<button type="submit">Search</button>
				</div>
			</form>
			<button name="AddEmployee">Add New Employee</button>
		</div>
		<div>
			<p><b>Search Results</b></p>
			
			<table class="table table-bordered">
				<thead>
					<tr>
						<th class="text-center">ID</th>
						<th class="text-center">First Name</th>
						<th class="text-center">Last Name</th>
						<th class="text-center">Email</th>
						<th class="text-center">Phone</th>
						<th class="text-center">Hire Date</th>
						<th class="text-center">Job Title</th>
						<th class="text-center">Salary</th>
						<th class="text-center">Department</th>
						<th class="text-center">Manager</th>
						<th class="text-center">Edit</th>
					</tr>
				</thead>
				<tbody>
					<c:if test="${not empty employees}">
						<c:forEach items="${employees}" var="employee">
							<tr>
								<td class="text-center"><c:out value="${employee.empid}" /></td>
								<td class="text-center"><c:out value="${employee.firstName}" /></td>
								<td class="text-center"><c:out value="${employee.lastName}" /></td>
								<td class="text-center link"><c:out value="${employee.email}" /></td>
								<td class="text-center"><c:out value="${employee.phone}" /></td>
								<td class="text-center"><c:out value="${employee.hireDate}" /></td>
								<td class="text-center"><c:out value="${employee.jobTitle}" /></td>
								<td class="text-center"><c:out value="${employee.salary}" /></td>
								<td class="text-center"><c:out value="${employee.department}" /></td>
								<td class="text-center"><c:out value="${employee.manager}" /></td>
								<td class="text-center"><button name="edit">...</button></td>
							</tr>
						</c:forEach>
					</c:if>
			</tbody>
		</table>
		<c:if test="${empty employees}">
			No Results
		</c:if>
	</div>
</div>
</body>
</html>
