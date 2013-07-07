// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
// You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/


$(document).ready(function(){

	function get_values(){
		options = {
			url: "/reservations/get_values",
			data: {
				schedule: window.location.pathname.split("/")[window.location.pathname.split("/").length-1].toString()
			},
			complete: function(response){
				array = $.parseJSON(response.responseText)
				console.log(array);
				for (var i = 0; i < array.length; ++i){
					console.log(array[i]);
					$("#"+ array[i][0] + "-" + array[i][1]).css("background-color", "red");
				}
			}
		}
		$.ajax(options);
	}

	get_values();

	$('.cell').on("click", function(event){
		console.log(event.target.id);
		var options = {
			url: "/reservations/create",
			data: {
				cell: event.target.id,
				schedule: window.location.pathname.split("/")[window.location.pathname.split("/").length-1].toString()
			},
			
			complete: function(response){
				console.log(response.responseText);
				if (response.responseText !== "Ok"){
					alert(response.responseText)
				} else {
					$("#"+event.target.id).css("background-color", "red");
				}
			}
		};

		$.ajax(options)
	});

});
