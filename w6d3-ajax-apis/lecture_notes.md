# AJAX, APIs and other useful things

## Code discussed in class
[Click here to get it!](https://www.dropbox.com/s/rdem7fn2itdr1ax/w6d3-ajax-apis.tgz?dl=1)

## Topics

- AJAX recap
    + Using jQuery AJAX functions
    + Dealing with data
        * callbacks
        * promises
- Using APIs
    + Consuming external APIs using Javascript
        * LCBO API: https://lcboapi.com/docs/v1
- Using client-side templates to simplify your life
    + Handlebars: http://handlebarsjs.com

There are a few things to keep in mind when using APIs:

- Security concerns (and how they can get in the way)
    + same-origin policy
        * https://en.wikipedia.org/wiki/Same-origin_policy
    + JSONP (JSON with Padding)
        * https://en.wikipedia.org/wiki/JSONP
        * request crafted to indicate we will expect a response wrapped as a script
            * always includes a parameter that indicates a function callback the wrapped script must call.
            * the server generates some JS that calls our callback with the JSON data as a parameter.
        + response is a script we can insert into the page and run, which calls our named callback method for this request.
        + alternately, you can proxy your requests through your server, making the same-origin-policy happy
    - CORS (Cross Origin Resource Sharing)
        + Some API's don't care who accesses what, so they just set the HTTP header: Access-Control-Allow-Origin: *
        + http://client.cors-api.appspot.com/client
        + https://developer.mozilla.org/en-US/docs/Web/HTTP/Access_control_CORS

