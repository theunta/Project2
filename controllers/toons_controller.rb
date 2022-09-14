require './models/toon'

get '/' do
  toons = all_toons()

  erb :'toons/index', locals: {
    toons: toons
  }
end

get '/toons/new' do
  erb :'toons/new'
end

post '/toons' do
  name = params['name']
  d_or_e = params['d_or_e']

  create_toon(name, d_or_e)

  redirect '/'
end

get '/toons/:id/edit' do
  id = params['id']
  toon = get_toon(id)
  
  erb :'toons/edit', locals: {
    toon: toon
  }
end

put '/toons/:id' do
  id = params['id']
  name = params['name']
  d_or_e = params['d_or_e']

  update_toon(id, name, d_or_e)
  redirect '/'
end

delete '/toons/:id' do
  id = params['id']
  
  delete_toon(id)
  redirect '/'
end
