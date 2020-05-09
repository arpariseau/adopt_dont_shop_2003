class SheltersController < ApplicationController
  def index
    @shelters = Shelter.all
  end

  def read
    @shelter = Shelter.find(params[:id])
  end

  def new

  end

  def create
    Shelter.create(shelter_params)
    redirect_to "/shelters"
  end

  def edit
    @shelter = Shelter.find(params[:id])
  end

  def update
    shelter = Shelter.find(params[:id])
    shelter.update(shelter_params)
    redirect_to "/shelters/#{shelter.id}"
  end

  def destroy
    Shelter.destroy(params[:id])
    redirect_to "/shelters"
  end

  def pets
    @shelter = Shelter.find(params[:id])
    @pets = @shelter.all_adoptable
  end

  private
  def shelter_params
    params.permit(:name, :address, :city, :state, :zip)
  end
end
