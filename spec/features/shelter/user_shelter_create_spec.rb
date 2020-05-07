require 'rails_helper'

RSpec.describe "Create shelter page", type: :feature do
  it "creates a new shelter" do
      visit '/shelters'
      click_link "New Shelter"
      expect(current_path).to eq('/shelters/new')

      fill_in :name, with: "Dumb Friends League"
      fill_in :address, with: "2080 S. Quebec St."
      fill_in :city, with: "Denver"
      fill_in :state, with: "CO"
      fill_in :zip, with: "80231"
      click_on "Create Shelter"

      new_shelter = Shelter.last
      expect(new_shelter.name).to eq("Dumb Friends League")
      expect(new_shelter.address).to eq("2080 S. Quebec St.")
      expect(new_shelter.city).to eq("Denver")
      expect(new_shelter.state).to eq("CO")
      expect(new_shelter.zip).to eq("80231")
      expect(current_path).to eq("/shelters")
      expect(page).to have_content(new_shelter.name)
  end
end
