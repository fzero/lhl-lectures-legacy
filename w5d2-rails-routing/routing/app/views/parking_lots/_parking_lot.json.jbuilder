json.extract! parking_lot, :id, :name, :address, :lat, :lng, :size, :price, :rating, :created_at, :updated_at
json.url parking_lot_url(parking_lot, format: :json)