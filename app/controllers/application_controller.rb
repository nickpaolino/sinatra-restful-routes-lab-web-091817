require 'pry'

class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end
  get '/' do
    erb :index
  end

  # Create
  get '/recipes/new' do
    erb :new
  end

  # Create
  post '/recipes' do
    recipe = Recipe.new
    recipe.name = params["name"]
    recipe.ingredients = params["ingredients"]
    recipe.cook_time = params["cook_time"]
    recipe.save

    redirect "/recipes/#{recipe.id}"
  end

  # Read
  get '/recipes' do
    @recipes = Recipe.all

    erb :index
  end

  # Read
  get '/recipes/:id' do
    @recipe = Recipe.find(params["id"])

    erb :show
  end

  # Update
  get '/recipes/:id/edit' do
    @recipe = Recipe.find(params["id"])

    erb :edit
  end

  # Update
  patch '/recipes/:id' do

    recipe = Recipe.find(params["id"])
    recipe.name = params["name"]
    recipe.ingredients = params["ingredients"]
    recipe.cook_time = params["cook_time"]
    recipe.save

    redirect "/recipes/#{recipe.id}"
  end

  delete '/recipes/:id/delete' do
    recipe = Recipe.find(params["id"])
    recipe.delete
  end
end
