require_relative 'gossip'
Gossip.init_csv

class ApplicationController < Sinatra::Base
  get '/' do
    erb :index, locals: {gossips: Gossip.all}
  end

  get '/gossips/new/' do
    erb :new_gossip
  end

post '/gossips/new/' do
  Gossip.new(params["gossip_author"], params["gossip_content"]).save
  redirect '/'
end

get '/show/:author' do 
 show = Gossip.find_author(params[:author])
 if show
  erb :show, locals: { show: show }
else
  status 404
  "Auteur inconnu"
end
 end


end