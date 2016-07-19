json.array!(@toppings) do |topping|
  json.extract! topping, :id, :topping_type, :flavour, :ice_cream_id
  json.url topping_url(topping, format: :json)
end
