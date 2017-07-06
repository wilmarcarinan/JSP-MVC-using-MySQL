<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Employee (Add/Edit)</title>
	<link rel="stylesheet" href="css/style.css" type="text/css">
	<link rel="stylesheet" href="css/jquery-ui.css" type="text/css">
	<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
	<script type="text/javascript" src="js/script.js"></script>
	<script type="text/javascript" src="js/jquery-ui.min.js"></script>
</head>
<body>
	<div id="AddEditForm">
		<p><b>Employee (Add/Edit)</b></p>
		<c:if test="${fn:length(sessionScope.AddEditErrors) gt 0}">
			<ul>
				<c:forEach items="${sessionScope.AddEditErrors}" var="error">
				<li class="error">
					<c:out value="${error}"/>
				</li>
			</c:forEach>
			</ul>
			<c:remove var="AddEditErrors" scope="session" />
		</c:if>
		<form method="POST" action="AddEdit">
			<input id="action" type="hidden" name="action" value='<c:out value="${param.action}" />'>
			<input type="hidden" id="empid" name="empid" value='<c:out value="${param.empid}" />'>
			<input type="hidden" id="oldEmail" name="oldEmail" value='<c:out value="${param.oldEmail}" />'>
			<div>
				<label>First Name</label>
				<c:choose>
					<c:when test="${not empty sessionScope.old}">
						<input type="text" id="FirstName" name="FirstName" value='<c:out value="${sessionScope.old[1]}" />'>
					</c:when>
					<c:otherwise>
						<input type="text" id="FirstName" name="FirstName" value='<c:out value="${employee.firstName}" />'>
					</c:otherwise>
				</c:choose>
			</div>

			<div>
				<label>Last Name</label>
				<c:choose>
					<c:when test="${not empty sessionScope.old}">
						<input type="text" id="LastName" name="LastName" value='<c:out value="${sessionScope.old[2]}" />'>
					</c:when>
					<c:otherwise>
						<input type="text" id="LastName" name="LastName" value='<c:out value="${employee.lastName}" />'>
					</c:otherwise>
				</c:choose>
			</div>

			<div>
				<label>Email</label>
				<c:choose>
					<c:when test="${not empty sessionScope.old}">
						<input type="text" id="Email" name="Email" value='<c:out value="${sessionScope.old[3]}" />'>
					</c:when>
					<c:otherwise>
						<input type="text" id="Email" name="Email" value='<c:out value="${employee.email}" />'>
					</c:otherwise>
				</c:choose>
			</div>

			<div>
				<label>Phone</label>
				<c:choose>
					<c:when test="${not empty sessionScope.old}">
						<input type="text" id="Phone" name="Phone" value='<c:out value="${sessionScope.old[4]}" />'>
					</c:when>
					<c:otherwise>
						<input type="text" id="Phone" name="Phone" value='<c:out value="${employee.phone}" />'>
					</c:otherwise>
				</c:choose>
			</div>

			<div>
				<label>Hire Date</label>
				<c:choose>
					<c:when test="${not empty sessionScope.old}">
						<input type="text" name="HireDate" id="addDate" value='<c:out value="${sessionScope.old[5]}" />'>
					</c:when>
					<c:otherwise>
						<input type="text" name="HireDate" id="addDate" value='<c:out value="${employee.hireDate}" />'>
					</c:otherwise>
				</c:choose>
			</div>

			<div>
				<label>Job Title</label>
				<select name="JobTitle" id="selectJob">
					<c:forEach items="${jobs}" var="job">
						<c:choose>
							<c:when test="${(not empty sessionScope.old) && (sessionScope.old[6] == job.jobTitle)}">
								<option value='<c:out value="${job.jobTitle}"/>' selected><c:out value="${job.jobTitle}"/></option>
							</c:when>
							<c:when test="${(not empty employee) && (employee.jobTitle == job.jobTitle)}">
								<option value='<c:out value="${employee.jobTitle}"/>' selected><c:out value="${employee.jobTitle}"/></option>
							</c:when>
							<c:otherwise>
								<option value='<c:out value="${job.jobTitle}"/>'><c:out value="${job.jobTitle}"/></option>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</select>
			</div>

			<div>
				<label>Salary</label>
				<c:choose>
					<c:when test="${not empty sessionScope.old}">
						<input type="text" id="Salary" name="Salary" value='<c:out value="${sessionScope.old[7]}" />'>
					</c:when>
					<c:otherwise>
						<input type="text" id="Salary" name="Salary" value='<c:out value="${employee.salary}" />'>
					</c:otherwise>
				</c:choose>
			</div>

			<div>
				<label>Commission</label>
				<c:choose>
					<c:when test="${not empty sessionScope.old}">
						<input type="text" name="Commission" id="Commission" readonly="" value='<c:out value="${sessionScope.old[8]}" />'>
					</c:when>
					<c:when test="${employee.department == 'Sales' && employee.commission != 0}">
						<input type="text" name="Commission" id="Commission" readonly="" value='<c:out value="${employee.commission}" />'>
					</c:when>
					<c:otherwise>
						<input type="text" name="Commission" id="Commission" readonly="" value="">
					</c:otherwise>
				</c:choose>
			</div>

			<div>
				<label>Department</label>
				<select name="Department" id="selectDept" onchange="dynamicManager()">
					<c:forEach items="${departments}" var="department">
						<c:choose>
							<c:when test="${(not empty sessionScope.old) && (sessionScope.old[9] == department.department)}">
								<option data-manager='<c:out value="${department.manager}"/>' data-managerID='<c:out value="${department.empid}"/>' value='<c:out value="${department.department}"/>' selected><c:out value="${department.department}"/></option>
							</c:when>
							<c:when test="${(not empty employee) && (employee.department == department.department)}">
								<option data-manager='<c:out value="${department.manager}"/>' data-managerID='<c:out value="${department.empid}"/>' value='<c:out value="${department.department}"/>' selected><c:out value="${department.department}"/></option>
							</c:when>
							<c:otherwise>
								<option data-manager='<c:out value="${department.manager}"/>' data-managerID='<c:out value="${department.empid}"/>' value='<c:out value="${department.department}"/>'><c:out value="${department.department}"/></option>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</select>
			</div>

			<div>
				<label>Manager</label>
				<input type="text" id="manager" name="manager" readonly="" value='<c:out value="${employee.manager}" />'>		
				<input type="hidden" id="manager_id" name="Manager_ID">
			</div>

			<div>
				<button type="submit" id="SubmitBtn">Save</button>
				<button type="button" id="CancelBtn">Cancel</button>
			</div>
		</form>
		<p id="border_firstName" class="hidden">
			<c:out value="${sessionScope.numErrors[0]}" />
		</p>
		<p id="border_lastName" class="hidden">
			<c:out value="${sessionScope.numErrors[1]}" />
		</p>
		<p id="border_email" class="hidden">
			<c:out value="${sessionScope.numErrors[2]}" />
		</p>
		<p id="border_phone" class="hidden">
			<c:out value="${sessionScope.numErrors[3]}" />
		</p>
		<p id="border_hireDate" class="hidden">
			<c:out value="${sessionScope.numErrors[4]}" />
		</p>
		<p id="border_selectJob" class="hidden">
			<c:out value="${sessionScope.numErrors[5]}" />
		</p>
		<p id="border_salary" class="hidden">
			<c:out value="${sessionScope.numErrors[6]}" />
		</p>
		<p id="border_commission" class="hidden">
			<c:out value="${sessionScope.numErrors[7]}" />
		</p>
		<p id="border_selectDept" class="hidden">
			<c:out value="${sessionScope.numErrors[8]}" />
		</p>
		<p id="border_manager" class="hidden">
			<c:out value="${sessionScope.numErrors[9]}" />
		</p>
		<c:remove var="old" scope="session" />
		<c:remove var="numErrors" scope="session" />
	</div>
</body>
</html>