// script for page 2 for selectorsActions
$(document).ready( function ()
{
	$("#startsWithEx").click( function ()
	{
		$("section[title ^= 'Text']").css("color", "red");
	});

	$("#containsEx").click( function ()
	{
		$("section:contains('color')").css("font-style", "italic");
		
	});

	$("#hasEx").click( function ()
	{
		$("section:has(p:contains('para3'))")
			.css("text-decoration", "underline");
	});

	//para funcs
	$("#clickMe").click( function ()
	{
		alert("You clicked me");
	});

	$("#slide").click( function ()
	{
		$(this).slideToggle("slow");
	});

	$("#fade").click( function ()
	{
		$(this).fadeOut(3000, function () 
		{
			$("#callBack").html("<img src='../images/back.gif'>");
		});
	});

	$("#callBack").click( function ()
	{
		$("#fade").fadeIn(3000, function ()
		{
			$("#callBack").html("");

		});
	});

});