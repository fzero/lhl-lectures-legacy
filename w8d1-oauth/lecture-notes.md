## Intro to OAuth

The Open Authentication, or OAuth, protocol allows web services to share user authentication and information.

By sharing the user authentication procedure websites can simply re-use accounts from another service to identify the users, making their life easier because they don't have to remember two accounts.

As part of the sign in process the user can optionally allow the site access to personal information from the OAuth provider. This means less time spent filling in their background information or choosing their profile picture.

A good intro in plain english: http://blog.varonis.com/introduction-to-oauth/

A more in-depth look: https://aaronparecki.com/2012/07/29/2/oauth2-simplified

## OAuth v1 vs. OAuth v2

OAuth history overview on Wikipedia: https://en.wikipedia.org/wiki/OAuth

Most prominent services use OAuth v2 these days, with two major exceptions: Twitter and Tumblr. 

OAuth 2.0 was developed to address some of the shortcomings of the original protocol. It was designed to allow for non-web based authentication, more security features and better user session management.

BUT! It's a "standard" - quotes necessary. The OAuth 2 spec was never formally finished, so every provider sends data in a different way.

## In a nutshell

We have three components talking to each other:

1. **The provider**: A server that contains the resources that applications want to access. This is usually Google, Facebook, Twitter, Github etc.
2. **The user**: The owner of the resources and the person who logs into your application.
3. **The application**: Your beautiful code! You want to get information about the user from the provider, thus avoiding yet another login/password form.

### Before anything happens

The **application** needs to be registered as an OAuth client with the **provider**. The application provides information such as a title, logo, description, and includes the OAuth callback URLs. The provider generates an **id** and **secret key** for the **application**. _You'll need to visit a developer page on the provider (Google, Facebook, Twitter etc.) to get your id and key._ See links further below.

### What happens when the user presses that "Login with Google" button

1. The **user** requests access your **application** and is redirected to the **provider**'s login page. The user is sent straight to the next step if they're already logged in.

2. The **provider** will ask permission from the **user** to allow your **application** to use (and maybe manage) their data. The **provider** redirects them to your **application**'s **callback URL** including their user identification code and a authorization code.

3. The **application** requests an **access token** from the **provider** using the authorization code and the application's secret key.

4. The **provider** authorizes the application to a limited subset of the user's information and the API.

5. We're done! Your app can use the **access token** to make API requests for that **user**'s information.

![](http://i.stack.imgur.com/Xn4c0.png)

## Libraries

* Ruby: [Omniauth gem](https://github.com/intridea/omniauth) and related [strategy gems](https://github.com/intridea/omniauth/wiki/List-of-Strategies)
    - [Documentation](https://github.com/intridea/omniauth/wiki)
    - Strategies: [Twitter](https://github.com/arunagw/omniauth-twitter), [Facebook](https://github.com/mkdynamic/omniauth-facebook), [Google](https://github.com/zquestz/omniauth-google-oauth2)
* Node.js: [Passport](http://passportjs.org/), [Passport-oauth](http://passportjs.org/docs/oauth) and related strategy packages
    - [Documentation](http://passportjs.org/docs/oauth)
    - Strategies: [Twitter](https://github.com/jaredhanson/passport-twitter), [Facebook](https://github.com/jaredhanson/passport-facebook), [Google](https://github.com/jaredhanson/passport-google)
* Client-side Javascript: [Hello.js](http://adodson.com/hello.js/)
    - OAuth 1 providers (Twitter and Tumblr) need server-side proxy component to work with Hello.js.

## Where do I register my app?

* Twitter: https://apps.twitter.com/
    - Docs: https://dev.twitter.com/oauth
* Facebook: https://developers.facebook.com/apps/
    - Docs: https://developers.facebook.com/docs/facebook-login/web
* Google: https://console.developers.google.com/
    - Docs: https://developers.google.com/identity/sign-in/web/

## Example Rails code with Facebook user login/creation

Courtesy of Railscasts: http://railscasts.com/episodes/360-facebook-authentication
