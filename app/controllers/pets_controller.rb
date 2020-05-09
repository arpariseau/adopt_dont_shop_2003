class PetsController < ApplicationController
  def index
    @pets = Pet.all
  end

  def read
    @pet = Pet.find(params[:id])
  end
end
