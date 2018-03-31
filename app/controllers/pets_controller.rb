class PetsController < ApplicationController

  get '/pets' do
    @pets = Pet.all
    erb :'/pets/index'
  end

  get '/pets/new' do
    @owners = Owner.all
    erb :'/pets/new'
  end

  post '/pets' do
    if !params["pet"]["name"].empty?
      @pet = Pet.create(name: params["pet"]["name"],owner_id: params["owner_id"])
    end
    binding.pry
    if !params["owner"].empty?
      @pet = Pet.create(name: params["pet"]["name"])
      @pet.owner = params[:owner]
    end

    redirect to "pets/#{@pet.id}"
  end

  get '/pets/:id' do
    @pet = Pet.find(params[:id])
    erb :'/pets/show'
  end

  post '/pets/:id' do

    redirect to "pets/#{@pet.id}"
  end
end
