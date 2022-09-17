require './models/toon'

get '/' do
  toons = all_toons()

  erb :'toons/index', locals: {
    toons: toons
  }
end
