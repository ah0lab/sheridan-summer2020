// localStorage.js
var studentData = [
	{"name" : "Mick Mouse", "id" : "991000111", "tuition" : 2000.00, 
		"scholarship" : 500.00},
	{"name" : "Don Duck", "id" : "991000222", "tuition" : 2000.00, 
		"scholarship" : 1500.00},	
	{"name" : "Pluto Dog", "id" : "991000333", "tuition" : 2000.00, 
		"scholarship" : 150.00},
	{"name" : "Nemo Fish", "id" : "991000444", "tuition" : 2000.00, 
		"scholarship" : 0.00},
	{"name" : "Simba Lion", "id" : "991000555", "tuition" : 2000.00, 
		"scholarship" : 750.00},
];

function createList() {
	// build <option>s in select / create a label first option
	document.getElementById ("selectBox").innerHTML = 
		`<option>Select an ID</option>`;
	document.getElementById ("students").innerHTML = 
		`<h1>Student Data</h1>`;

	// Create drop-down list


	// display student data
	for (let student of studentData) {
		document.getElementById ("selectBox").innerHTML += 
			`<option>${student.id}</option>`;
		document.getElementById ("students").innerHTML += 
			`<strong>Name: ${student.name} - ID: ${student.id}</strong><br/>
			 Tuition: ${student.tuition} - Scholarship: ${student.scholarship}
			<hr/>`;
	}

}

function saveDataToLS() {
	let index = 
		document.getElementById ("selectBox").selectedIndex - 1;
	localStorage.setItem ("name", studentData[index].name);
	localStorage.setItem ("id", studentData[index].id);
	localStorage.setItem ("tuition", studentData[index].tuition);
	localStorage.setItem ("scholarship", studentData[index].scholarship);
}

function makeReport() {
	saveDataToLS();
	// go to report.html
	location.assign("./report.html");

}

function loadReport() {
	// get data from local storage
	document.getElementById("outid").value = localStorage.getItem("id");	
	document.getElementById("outname").value = localStorage.getItem("name");	
	let tuition = parseFloat(localStorage.getItem("tuition"));
	let scholarship = parseFloat(localStorage.getItem("scholarship"));

	document.getElementById("outamount").value = 
		((tuition - scholarship) * 1.13).toFixed(2);

}

function goToIndex() {
	location.assign("./index.html");
}

function printData() {
	window.print();
 
}

