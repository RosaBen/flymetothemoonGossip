# frozen_string_literal: true

require_relative 'gossip'
Gossip.init_csv

class ApplicationController < Sinatra::Base
  get '/' do
    erb :index, locals: { gossips: Gossip.all }
  end

  get '/gossips/new/' do
    erb :new_gossip
  end

  post '/gossips/new/' do
    Gossip.new(params['gossip_author'], params['gossip_content']).save
    redirect '/'
  end

  get '/gossips/:id' do
    id = params[:id].to_i - 1
    gossip = Gossip.find(id)
    erb :show, locals: { show: gossip }
  end
end
