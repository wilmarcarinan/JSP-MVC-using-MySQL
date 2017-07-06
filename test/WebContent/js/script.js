$( function() {
	$( "#HireDate" ).datepicker({
		dateFormat: "yy/mm/dd"
	});
	$( "#HireDate2" ).datepicker({
		dateFormat: "yy/mm/dd"
	});
	$( "#addDate" ).datepicker({
		dateFormat: "yy/mm/dd"
	});
} );

function dynamicManager(){
	var selectedDept = document.getElementById("selectDept");
	var manager = document.getElementById("manager");
	var manager_id = document.getElementById("manager_id");
	var commission = document.getElementById("commission");
	
	manager.value = selectedDept.options[selectedDept.selectedIndex].getAttribute("data-manager");
	manager_id.value = selectedDept.options[selectedDept.selectedIndex].getAttribute("data-managerID");

	if (selectedDept.options[selectedDept.selectedIndex].value == "Sales") {
		commission.removeAttribute("readonly");
	} else {
		commission.setAttribute("readonly", "");
		commission.value = "";
	}

}

$(document).ready(function() {
	$("#addButton").click(function() {
		window.location.replace("AddEdit?action=add");
	});

	$("#CancelBtn").click(function() {
		window.location.replace("ListEmployee?action=ListEmployee&page=1");
	});

	var action = "";

	if (document.getElementById("action") != null) {
		action = document.getElementById("action");
		var border_firstName = parseInt(document.getElementById("border_firstName").innerText);
		var border_lastName = parseInt(document.getElementById("border_lastName").innerText);
		var border_email = parseInt(document.getElementById("border_email").innerText);

		var FirstName = document.getElementById("FirstName");
		var LastName = document.getElementById("LastName");
		var Email = document.getElementById("Email");

		if (border_firstName == 1) {
			FirstName.className = "error-border";
		} else {
			FirstName.className = "";
		}

		if (border_lastName == 1) {
			LastName.className = "error-border";
		} else {
			LastName.className = "";
		}

		if (border_email == 1) {
			Email.className = "error-border";
		} else {
			Email.className = "";
		}

		if (action.innerText == "ListEmployee" || action.innerText == "search") {
			var currentPage = document.getElementById('currentPage');
			var previousPage = document.getElementById('previousPage');
			var firstPage = document.getElementById('firstPage');
			var nextPage = document.getElementById('nextPage');
			var lastPage = document.getElementById('lastPage');
			var totalRows = parseInt(document.getElementById('totalRows').innerText); 
			var firstNameParams = document.getElementById("firstNameParams");
			var lastNameParams = document.getElementById("lastNameParams");
			var emailParams = document.getElementById("emailParams");
			var hireDateParams = document.getElementById("hireDateParams");
			var hireDateParams2 = document.getElementById("hireDateParams2");
			var HireDate = document.getElementById("HireDate");
			var HireDate2 = document.getElementById("HireDate2");
			var hireDate = "";
			var hireDate2 = "";
			var border_startDate = parseInt(document.getElementById("border_startDate").innerText);
			var border_endDate = parseInt(document.getElementById("border_endDate").innerText);

			if (border_startDate == 1) {
				HireDate.className = "error-border";
			} else {
				HireDate.className = "";
			}

			if (border_endDate == 1) {
				HireDate2.className = "error-border";
			} else {
				HireDate2.className = "";
			}

			if (totalRows > 99 || totalRows%10 == 0) {
				var totalPage = parseInt((totalRows / 10));
			} else {
				var totalPage = parseInt(totalRows / 10) + 1;
			}

			if (hireDateParams.innerText != null) {
				hireDate = hireDateParams.innerText.split("/").join("%2F");
			}

			if (hireDateParams2.innerText != null) {
				hireDate2 = hireDateParams2.innerText.split("/").join("%2F");
			}

			if (action.innerText == "ListEmployee") {
				if (currentPage.text == 1) {
					previousPage.className = "hidden";
					firstPage.className = "hidden";
				} else {
					previousPage.setAttribute("href", "ListEmployee?action=ListEmployee&page=" + ((currentPage.text) - 1));
					firstPage.setAttribute("href","ListEmployee?action=ListEmployee&page=1");
				}

				if (currentPage.text == totalPage) {
					nextPage.className = "hidden";
					lastPage.className = "hidden";
				} else {
					nextPage.setAttribute("href","ListEmployee?action=ListEmployee&page=" + (parseInt(currentPage.text) + 1));
					lastPage.setAttribute("href","ListEmployee?action=ListEmployee&page=" + totalPage);
				}
			} else if (action.innerText == "search") {
				if (currentPage.text == 1) {
					previousPage.className = "hidden";
					firstPage.className = "hidden";
				} else {
					previousPage.setAttribute("href", "ListEmployee?action=" + action.innerText + "&page=" + ((currentPage.text) - 1) 
						+ "&FirstName=" + firstNameParams.innerText + "&LastName=" + lastNameParams.innerText + "&Email=" + emailParams.innerText
						+ "&HireDate=" + hireDate + "&HireDate2=" + hireDate2);
					firstPage.setAttribute("href","ListEmployee?action=" + action.innerText + "&page=1" 
						+ "&FirstName=" + firstNameParams.innerText + "&LastName=" + lastNameParams.innerText + "&Email=" + emailParams.innerText
						+ "&HireDate=" + hireDate + "&HireDate2=" + hireDate2);
				}
				
				if (currentPage.text == totalPage) {
					nextPage.className = "hidden";
					lastPage.className = "hidden";
				} else {
					nextPage.setAttribute("href","ListEmployee?action=" + action.innerText + "&page=" + (parseInt(currentPage.text) + 1) 
						+ "&FirstName=" + firstNameParams.innerText + "&LastName=" + lastNameParams.innerText + "&Email=" + emailParams.innerText
						+ "&HireDate=" + hireDate + "&HireDate2=" + hireDate2);
					lastPage.setAttribute("href","ListEmployee?action=" + action.innerText + "&page=" + totalPage 
						+ "&FirstName=" + firstNameParams.innerText + "&LastName=" + lastNameParams.innerText + "&Email=" + emailParams.innerText
						+ "&HireDate=" + hireDate + "&HireDate2=" + hireDate2);
				}
			}
		} else {
			var phone = document.getElementById("Phone");
			var addDate = document.getElementById("addDate");
			var selectedJob = document.getElementById("selectJob");
			var salary = document.getElementById("Salary");
			var commission = document.getElementById("Commission");
			var selectedDept = document.getElementById("selectDept");
			var manager = document.getElementById("manager");
			var manager_id = document.getElementById("manager_id");
			var SubmitBtn = document.getElementById("SubmitBtn");
			var border_phone = parseInt(document.getElementById("border_phone").innerText);
			var border_hireDate = parseInt(document.getElementById("border_hireDate").innerText);
			var border_selectJob = parseInt(document.getElementById("border_selectJob").innerText);
			var border_salary = parseInt(document.getElementById("border_salary").innerText);
			var border_commission = parseInt(document.getElementById("border_commission").innerText);
			var border_selectDept = parseInt(document.getElementById("border_selectDept").innerText);
			var border_manager = parseInt(document.getElementById("border_manager").innerText);

			manager.value = selectedDept.options[selectedDept.selectedIndex].getAttribute("data-manager");
			manager_id.value = selectedDept.options[selectedDept.selectedIndex].getAttribute("data-managerID");

			if (action.value == "edit") {
				SubmitBtn.innerText = "Update";
			} else {
				SubmitBtn.innerText = "Save";
			}

			if (selectedDept.options[selectedDept.selectedIndex].value == "Sales") {
				commission.removeAttribute("readonly");
			} else {
				commission.setAttribute("readonly", "");
				commission.value = "";
			}

			if (border_phone == 1) {
				phone.className = "error-border";
			} else {
				phone.className = "";
			}

			if (border_hireDate == 1) {
				addDate.className = "error-border";
			} else {
				addDate.className = "";
			}

			if (border_selectJob == 1) {
				selectedJob.className = "error-border";
			} else {
				selectedJob.className = "";
			}

			if (border_salary == 1) {
				salary.className = "error-border";
			} else {
				salary.className = "";
			}

			if (border_commission == 1) {
				commission.className = "error-border";
			} else {
				commission.className = "";
			}

			if (border_selectDept == 1) {
				selectedDept.className = "error-border";
			} else {
				selectedDept = "";
			}

			if (border_manager == 1) {
				manager.className = "error-border";
			} else {
				manager.className = "";
			}
		}
	}
	
	
	
	
});

