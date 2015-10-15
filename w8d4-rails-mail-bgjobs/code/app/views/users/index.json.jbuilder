json.array!(@users) do |user|
  json.extract! user, :id, :name, :email, :subscribed
  json.url user_url(user, format: :json)
end
