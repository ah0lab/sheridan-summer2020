
var PrintAssignmentHeader = function (name)
{
	$("header .heading").html (`A1 for ${name}`);
},

PrintAssignmentFooter = function (id, username)
{
	$("footer #studentInfo").html (`
		<h4>
			<span class="id">${id}</span>/
			<span class="username">${username}</span>
		</h4>
	`);
};

$(document).ready ( function ()
{
	var username  = localStorage.getItem ('studentUsername'),
		studentID = localStorage.getItem ('studentID'),
		name 	  = localStorage.getItem ('studentName');
	PrintAssignmentHeader (name);
	PrintAssignmentFooter (studentID, username);

	$("#bio-text h4").html (`My Name is ${name}`);
	$("#bio-text h5").html (`My Student Number is ${studentID}`);
	$("#bio-text h6").html (`My Sheridan Login is ${username}`);
})