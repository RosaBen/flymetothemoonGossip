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

 get '/gossips/:id' do
  id = params[:id].to_i - 1
  gossips = Gossip.all
  if id >= 0 && id < gossips.length && gossips[id]
    erb :show, locals: { show: gossips[id] }
  else
    status 404
    "Gossip non retrouvé"
  end
 end


end