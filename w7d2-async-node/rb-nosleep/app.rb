require 'sinatra'

get '/bodymovin' do
  "We're getting down computer action"
end

get '/sabotage' do
  redirect "https://www.youtube.com/watch?v=z5rRZdiu1UE"
end

get '/sleep/:seconds' do
  seconds = params[:seconds].to_i
  sleep_how_much = seconds > 0 ? "Sleep! #{seconds}!" : "No! Sleep!"
  sleep seconds
  "#{sleep_how_much} Til Brooklyn!"
end
