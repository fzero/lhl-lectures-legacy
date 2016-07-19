json.array!(@ice_creams) do |ice_cream|
  json.extract! ice_cream, :id, :flavour, :size, :ice_cream_type, :cone
  json.url ice_cream_url(ice_cream, format: :json)
end
