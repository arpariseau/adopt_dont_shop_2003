class SheltersController < ApplicationController
  def index
    @shelters = Shelter.all
  end

  def read
    @shelter = Shelter.find(params[:id])
  end
end
