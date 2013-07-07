// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
// You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/


$(document).ready(function(){

	console.log("ok");
	$('.cell').on("click", function(event){
		console.log(event.target.id);
		var options = {
			url: "/reservations/create",
			data: event.target.id,
			
			complete: function(response){
				console.log(response.responseText);
			}
		};

		$.ajax(options)
	});

});
