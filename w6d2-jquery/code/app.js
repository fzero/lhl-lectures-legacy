$(function(){

  $('#something').on('input', function(){
    var something = $(this).val(); // `this` is the DOM element; `$(this)` is the jQuery element
    if (!something) something = "Hello there";
    $('h1:first')[0].innerText = something; // Using straight DOM property here
  });

  $('#thelink').on('click', function(ev){
    ev.preventDefault(); // Prevents the default action - opening the link
    ev.stopPropagation(); // Prevents propagation of the event to outer elements
    alert('a clicked!');
  });

  $('#clickable').on('click', function(ev){
    alert('p clicked!');
  });

});
