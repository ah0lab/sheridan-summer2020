//TODO: variables for username and login

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
},

// Create a Class in your .js file that includes fields 
// 	for initial, element, and image file name
InitialElement = function (props) {

	let _initial = props.initial || '',
		_elem 	 = props.elem || '',
		_image   = props.image || '';

	return {
		getInitial : function () { return _initial;   },
		getElem	   : function () { return _elem;	  },
		getImage   : function () { return _image;	  }
	};
},

// Populate an array that is based on the Class
BuildList = function () {
	let initialArray = [];
	$("#listArea span").each (function () {
		let letter = this.dataset.initial.toUpperCase();
		initialArray.push ( InitialElement({
			initial : letter,
			elem 	: this.dataset.element,
			image  : this.dataset.elemImg
		}));
		console.log(this.dataset.elemImg);
	});

	return initialArray;
},

// Use a for/of loop to populate the list
GenerateListHTML = function (listData) {
	$("#listArea span").remove ()
	$("#listArea").append ("<ul></ul>");
	HTMLList = $("#listArea ul");

	listData.forEach( function(listElement) {
		HTMLList.append (
			`<li title='${listElement.getElem()}'>
				${listElement.getInitial()} is for ${listElement.getElem()}
				<img src='${listElement.getImage()}' width='25' />
			</li>`);
	});

};


$(document).ready( function ()
{
	var studentName 	= 'Benjamin Ahola',
		studentID		= '991361645',
		studentUsername = 'aholab';

	// Populate header line
	PrintAssignmentHeader (studentName);

	// Populate footer line
	PrintAssignmentFooter (studentID, studentUsername);

	// Save your name, id, and login to local storage
	localStorage.setItem ('studentName', studentName);
	localStorage.setItem ('studentID', studentID);
	localStorage.setItem ('studentUsername', studentUsername);

	GenerateListHTML (BuildList ());

	// Events

	$('#toggleBtn').click (function () 
	{
		let letter = $("input#letter").val()[0].toLowerCase();

		// Toggle (hide/show) list items whose 
		//	title attribute starts with the letter entered in the input box
		$(`#listArea li[title ^= '${letter}']`).toggle();
	});

	$('#toggleStyleBtn').click (function ()
	{
		$('#listArea li').toggleClass('emphasize');

	});

	$('#navtopersonal').click (function ()
	{
		location.assign ('./pages/personal.html');
	});

});