(function(){

  // LCBO credentials
  var ACCESS_KEY = 'MDozMWFmODRkYy0zZTAxLTExZTYtYjJlNy02ZmY5ZWE4ZDZlOWI6TkxTU0ZxMVIxemo0TThLRmJsUmlTYlo4Mm15QVJlbFd5UUtu'
  var BASE_API_URL = 'https://lcboapi.com/'

  // It's a good idea to group your API functions in an object
  // or class.
  var LCBO = {
    getStores: function(query) {
      var q = query ? ('stores?q=' + query) : 'stores'
      // Note we're returning the $.ajax call itself
      // so we can use promises!
      return $.ajax({
        url: BASE_API_URL + q,
        // The LCBO API requires us to send the authorization
        // token as a special header on every request.
        headers: { 'Authorization': 'Token ' + ACCESS_KEY }
      })
    },

    getProducts: function(query) {
      var q = query ? ('products?q=' + query) : 'products'
      return $.ajax({
        url: BASE_API_URL + q,
        headers: { 'Authorization': 'Token ' + ACCESS_KEY }
      })
    }
  }


  // Using Handlebars templates:
  // The first line gets the HTML contents of the template...
  var stores_source = $("#stores-template").html()
  // ...while the second returns a function that takes in
  // a JS object and fills in the template with the given data.
  var stores_template = Handlebars.compile(stores_source)

  // You can condense the two steps in a single call, of course
  var products_template = Handlebars.compile($("#products-template").html())


  // The following functions are used with promises on $.ajax calls.
  // Each one receives a single parameter and should return any data
  // objects necessary for the next step.
  // This one simply logs data.
  function logData(data) {
    console.log(data)
    return data
  }


  // This uses returned store data do create an HTML block
  // that we're inserting into the #store-data-container DOM element.
  function displayStoreData(data) {
    $('#data-container')
    .empty() // Clear container contents first
    .html(stores_template(data))
    return data
  }


  function displayProductData(data) {
    $('#data-container')
    .empty()
    .html(products_template(data))
    return data
  }


  // LCBO returns prices in cents, so we need to
  // pre-process the data
  function processProductData(data) {
    var results = data.result
    // Replacing data.result with processed copy created
    // using Array.prototype.map (think Ruby's Array#map using a
    // callback instead of a block).
    data.result = results.map(function(r) {
      r.price = (r.price_in_cents / 100).toFixed(2)
      // We can add further processing here. For example, I don't
      // like the "Canada, Region Not Specified" thing on r.origin.
      // You could use String.prototype.replace() here to fix it.
      // Another one: some products don't have images. We can test
      // r.image_thumb_url for null/undefined and add a placeholder.
      return r
    })
    return data
  }


  // Form hooks
  $('#store-search').on('submit', function(e) {
    e.preventDefault()
    var query = $('#store-query').val()

    // Promises allow us to do several operations on
    // the data in order.
    LCBO.getStores(query)
    .then(logData)
    .then(displayStoreData)
  })


  $('#product-search').on('submit', function(e) {
    e.preventDefault()
    var query = $('#product-query').val()

    // Here we're processing the data before displaying it
    LCBO.getProducts(query)
    .then(processProductData)
    .then(logData)
    .then(displayProductData)
  })

})()
