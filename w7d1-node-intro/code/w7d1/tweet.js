var Twitter = require('twitter')

var client = new Twitter({
  consumer_key: 'xCeGHtYLBY7oJ2yGz6HAVnROP',
  consumer_secret: 'HeHtqWAIrKTK12gp3dLcdu0IagFJ3HGJkyEWl1TwYLHpvF3pMx',
  access_token_key: '8592632-5LmmduonSmYfcUOJSFDah5B4eFAy6lCMF9TX6tb3c8',
  access_token_secret: 'uvemd33Hv3uXWlfk9IdU4YSci2yKwwznsndCgb3knYUZl'
});

exports.getTweets = function(screen_name) {
  var params = {screen_name: screen_name};
  client.get('statuses/user_timeline', params, function(error, tweets, response){
    if (!error) {
      tweets.forEach((tweet) => {
        console.log(tweet.text)
      })
    }
  });
}
