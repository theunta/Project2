require './models/review'

get '/review/new' do
  erb :'review/new'
end

post '/review' do
  username = params['username']
  contents = params['contents']

  create_review(username, contents)

  # if the request is NOT a GET request, then we must redirect instead of using erb.
  redirect '/'
end

# the :id is a route parameter
get '/review/:id/edit' do
  id = params['id']
  review = get_review(id)
  
  erb :'review/edit', locals: {
    review: review
  }
end

put '/review/:id' do
  id = params['id']
  username = params['username']
  contents = params['contents']

  update_review(id, username, contents)
  redirect '/'
end

delete '/review/:id' do
  id = params['id']
  
  delete_review(id)
  redirect '/'
end
