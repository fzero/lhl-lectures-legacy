# Homepage (Root path)
get '/' do
  erb :index
end

get '/clowns' do
	Clown.all.to_json
end	

post '/clowns/create' do
	response = Hash.new
	response[:result] = false
	clown = Clown.new(name: params[:name], hair: params[:hair], gimmick: params[:gimmick])

	if clown.save
		response[:result] = true
		response[:id] = clown.id
	end

	response.to_json
end
