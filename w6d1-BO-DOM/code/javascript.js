// Using an IIFE to protect variables defined here
(function(){
  var application = "My beautiful twisted dark application";
  var btn = document.querySelector('#thebutton');
  var inner = document.querySelector('#inner');
  var outer = document.querySelector('#outer');

  btn.addEventListener('click', function(ev) {
    ev.stopPropagation();
    alert(application);
  })

  inner.addEventListener('click', function(ev) {
    alert('inner');
  })

  outer.addEventListener('click', function(ev) {
    alert('outer');
  })

  // To make a variable global we need to manually attach it to window
  window.global_value = "Something";
})();
