// Monkeypatch Array to add a Ruby-like sample() method
Array.prototype.sample = function() {
  var index = Math.floor(Math.random() * this.length);
  return this[index];
}


// This is an object literal which is going to hold all of my clown data,
// event handlers and callback functions.
var Clowns = {

  names: ['Smiley', 'Scary', 'Clonky', 'Kablooey', 'Rowdy', 'Blondie', 'Dandy'],

  hairs: ['orange', 'green', 'blue', 'horrible', 'terrible', 'frizzy'],

  gimmicks: [
    'terrifying children',
    'fitting into tiny cars',
    'blowing up neighbourhoods',
    'flower that spits water',
    'being really depressed',
    'asking how magnets work'
  ],

  getClowns: function() {
    //Performing a GET request and expecting JSON data
    $.getJSON('/clowns', Clowns.processClowns);
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
      name: Clowns.names.sample(),
      hair: Clowns.hairs.sample(),
      gimmick: Clowns.gimmicks.sample()
    };

    //Fourth parameter here is the expected data type from the server.
    $.post('/clowns/create', newClown, Clowns.addedClown, 'json');
  },


  addedClown: function(data) {
    //Again, the 'data' param is the JSON data from the server
    if (data.result) {
      Clowns.getClowns();
    }
    else {
      alert("You screwed something up.");
    }
  }
};


$(function() {
  $("#getClowns").on('click', Clowns.getClowns);
  $("#makeClown").on('click', Clowns.addClown);
});
