#require 'bundler' #permet de lire le Gemfile ainsi pas besoin de mettre des require partout
#Bundler.require
require 'gossip'
class ApplicationController < Sinatra::Base #création d'une classe controller qui hérite de sinatra (aura donc toutes les fonctionnalités de sinatra)
  attr_accessor :id
  get '/' do #si quelqu'un va sur l'URL, exécute le code qui suit
    #{}"<html><head><title>The Gossip Project</title></head><body><h1>Mon super site de gossip !</h1></body></html>"
      erb :index, locals: {gossips: Gossip.all}
  end

  get '/gossip/new/' do
    erb :new_gossip
  end

  post '/gossip/new/' do
   Gossip.new(params["gossip_author"], params["gossip_content"]).save
    redirect '/'
  end

  get '/gossip/:id/' do
  	@id = params["id"]
  	erb :gossip_id
  end

  get '/gossip/:id/edit/' do
  erb :edit
  end

  post '/gossip/:id/edit/' do
    Gossip.new(params["gossip_author"], params["gossip_content"]).edit
  end
  #run! if app_file == $0 #permet d'exécuter le code de la classe sans avoir à écrire ApplicationController.new.perform

end