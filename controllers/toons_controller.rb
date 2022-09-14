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
  image_url = params['image_url']

  create_toon(name, image_url)

  # if the request is NOT a GET request, then we must redirect instead of using erb.
  redirect '/'
end

# the :id is a route parameter
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
  image_url = params['image_url']

  update_toon(id, name, image_url)
  redirect '/'
end

delete '/toons/:id' do
  id = params['id']
  
  delete_toon(id)
  redirect '/'
end

post '/toons/:id/likes' do
  toon_id = params['id']
  user_id = session['user_id']

  run_sql("INSERT INTO likes(user_id, toon_id) VALUES($1, $2)", [user_id, toon_id])
  redirect '/'
end