$( function() {
	$( "#HireDate" ).datepicker();
	$( "#HireDate2" ).datepicker();
} );

$(document).ready(function() {
	var currentPage = document.getElementById('currentPage');
	var previousPage = document.getElementById('previousPage');
	var firstPage = document.getElementById('firstPage');
	var nextPage = document.getElementById('nextPage');
	var lastPage = document.getElementById('lastPage');
	var totalRows = parseInt(document.getElementById('totalRows').innerText);
	var action = document.getElementById("action");
	var firstNameParams = document.getElementById("firstNameParams");
	var lastNameParams = document.getElementById("lastNameParams");
	var emailParams = document.getElementById("emailParams");
	var hireDateParams = document.getElementById("hireDateParams");
	var hireDateParams2 = document.getElementById("hireDateParams2");
	var hireDate = hireDateParams.innerText.split("/").join("%2F");
	var hireDate2 = hireDateParams2.innerText.split("/").join("%2F");

	if (totalRows > 99) {
		var totalPage = parseInt((totalRows / 10));
	} else {
		var totalPage = parseInt(totalRows / 10) + 1;
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

		if (currentPage.text == (totalPage + 1)) {
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
});