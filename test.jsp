<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Employees List</title>
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
				<input type="hidden" name="page" value="1">
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
					<input type="text" id="Email" name="Email">
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
			<p><b>Search Results</b> &nbsp; &nbsp;
				<c:if test="${not empty employees}">
					<span id="totalRows"><c:out value="${employees.get(0).getTotal()}" /></span> results
				</c:if>
			</p>
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
						<!-- <td class="text-center"><a href="#" id="editButton">...</a></td> -->
						<td class="text-center"><button name="edit" id="editButton">...</button></td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
			<c:choose>
				<c:when test="${not empty employees}">
					<c:if test="${employees.get(0).getTotal() gt 10}">
						<a href="#" id="firstPage"><< First</a>
						<a href="#" id="previousPage"><< Previous</a>
						<a href="#" id="currentPage"><%= request.getParameter("page")%></a>
						<a href="#" id="nextPage">Next ></a>
						<a href="#" id="lastPage">Last >></a>
					</c:if>
					<p class="hidden" id="action"><%= request.getParameter("action") %></p>
					<p class="hidden" id="firstNameParams"><%= request.getParameter("FirstName") %></p>
					<p class="hidden" id="lastNameParams"><%= request.getParameter("LastName") %></p>
					<p class="hidden" id="emailParams"><%= request.getParameter("Email") %></p>
					<p class="hidden" id="hireDateParams"><%= request.getParameter("HireDate") %></p>
					<p class="hidden" id="hireDateParams2"><%= request.getParameter("HireDate2") %></p>
				</c:when>
				<c:otherwise>
					<h4 class="error">
						<center>No Results Found</center>
					</h4>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
</body>
</html>