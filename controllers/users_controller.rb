require './models/user'

get '/' do
  @npc_type = get_npc(@npc_type)
  erb :'users/index'
end

get '/users/new' do
  erb :'users/new'
end

post '/users' do
  first_name = params['first_name']
  last_name = params['last_name']
  email = params['email']
  password = params['password']
  d_or_e = params['d_or_e']
  profession = params['profession']
  wins = 0
  losses = 0
  draws = 0 

  create_user(first_name, last_name, email, password, d_or_e, profession, wins, losses, draws)
  redirect '/'
end

get '/users/:id/edit' do
  id = params['id']
  d_or_e = params['d_or_e']
  profession = params['profession']
  
  erb :'users/edit'
end

patch '/users/:id' do
  # update user data
  id = params['id']
  d_or_e = params['d_or_e']
  profession = params['profession']

  update_user(id, d_or_e, profession)
  redirect '/'
end

delete '/users/:id' do
  id = params['id']
  
  delete_user(id)
  redirect '/'
end

post '/users/battle' do
  # god help me make this code just work magically
  run_game(current_user['id'], current_user['profession'], current_user['wins'], current_user['losses'], current_user['draws'])
  sleep 12
  redirect '/'
end