require 'rails_helper'

RSpec.describe "Shelter update", type: :feature do
  it "updates a shelter" do
    shelter_1 = Shelter.create(name: "Dumb Friends League",
                               address: "2080 S. Quebec St.",
                               city: "Denver",
                               state: "CO",
                               zip: "80231")

    visit "/shelters/#{shelter_1.id}"
    click_button "Update Shelter"
    expect(current_path).to eq("/shelters/#{shelter_1.id}/edit")

    fill_in :name, with: "Monterey Bay Aquarium"
    fill_in :address, with: "886 Cannery Row"
    fill_in :city, with: "Monterey"
    fill_in :state, with: "CA"
    fill_in :zip, with: "93940"
    click_button "Update Shelter"

    expect(current_path).to eq("/shelters/#{shelter_1.id}")
    expect(page).to have_content("Monterey Bay Aquarium")
    expect(page).to have_content("886 Cannery Row")
    expect(page).to have_content("Monterey")
    expect(page).to have_content("CA")
    expect(page).to have_content("93940")
  end
end
