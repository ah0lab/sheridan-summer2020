// myscript.js for selectorsActions
$(document).ready(function ()
{

	$("h3:first").html("Selector and ").append("Actions and DOM");

	$("h3:first").css("font-family", "courier");
	$("h3:nth(0)").addClass("h3Style");

	$("#gifImages").click( function () 
	{
		$("#list img[src $= '.gif']").addClass("gifBorder")
	});

	$("#clearGIF").click( function () 
	{
		$("#list img[src $= '.gif']").removeClass("gifBorder")
	});

	$("#pngToggle").click( function ()
	{
		$("#list img[src $= '.png']").toggle();
	});

	$("#spinJPG").click( function ()
	{
		$("#list img[src $= '.jpg']").toggleClass("rotate");
	});
});
