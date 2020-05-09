class PetsController < ApplicationController
  def index
    @pets = Pet.all
  end

  def read
    @pet = Pet.find(params[:id])
  end

  def new
    @shelter = Shelter.find(params[:id])
  end

  def create
    Pet.create(pet_params)
    redirect_to "/shelters/#{params[:id]}/pets"
  end

  private
  def pet_params
    newpet_params = params.permit(:name, :image, :description, :approx_age, :sex)
    newpet_params[:shelter_id] = params[:id]
    newpet_params[:adopt_status] = "adoptable"
    newpet_params
  end
end
