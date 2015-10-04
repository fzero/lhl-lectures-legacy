//This is an object literal which is going to hold all of my event handlers
//and callback functions.
var handlers = {


	getClowns: function() {
		//Performing a GET request and expecting JSON data
		$.getJSON('/clowns', handlers.processClowns);
	},


	processClowns: function(data) {
		//The data param in this function is the JSON data
		//returned from the server
		var table = $("#clowns").find('tbody').empty();
		//Calling .empty() allows us to 'reset' the table each time
		$.each(data, function(index, clown) {
			var tr = $("<tr>").appendTo(table);
			$("<td>").text(clown.name).appendTo(tr);
			$("<td>").text(clown.hair).appendTo(tr);
			$("<td>").text(clown.gimmick).appendTo(tr);
		});
		//Shows the results once it has all been assembled
		$("#results").removeClass('hide');
	},


	addClown: function() {
		//Callback function for the Add Clown button
		var newClown = {
			name: "Smiley",
			hair: "orange",
			gimmick: "terrifying children"
		};

		//Fourth parameter here is the expected data type from the server.
		$.post('/clowns/create', newClown, handlers.addedClown, 'json');
	},


	addedClown: function(data) {
		//Again, the 'data' param is the JSON data from the server
		if (data.result) {
			handlers.getClowns();
		} else {
			alert("You screwed something up.");
		}
	}
};


$(function() {
	$("#getClowns").on('click', handlers.getClowns);
	$("#makeClown").on('click', handlers.addClown);
});
