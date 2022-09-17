require './models/user'

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

  create_user(first_name, last_name, email, password, d_or_e, profession)
  redirect '/'
end

get '/users/edit' do
  id = params['id']
  d_or_e = params['d_or_e']
  profession = params['profession']
end

put '/users/:id' do
  id = params['id']
  d_or_e = params['d_or_e']
  profession = params['profession']

  update_user(id, d_or_e, profession)
  redirect '/'
end