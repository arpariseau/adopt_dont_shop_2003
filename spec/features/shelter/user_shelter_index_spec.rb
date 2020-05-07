require 'rails_helper'

RSpec.describe "Shelter index page", type: :feature do
  it "shows user all shelters on index visit" do
    shelter_1 = Shelter.create(name: "Dumb Friends League",
                               address: "2080 S. Quebec St.",
                               city: "Denver",
                               state: "CO",
                               zip: "80231")

    shelter_2 = Shelter.create(name: "Denver Animal Shelter",
                               address: "1241 W. Bayaud Ave.",
                               city: "Denver",
                               state: "CO",
                               zip: "80223")

    visit "/shelters"

    expect(page).to have_content(shelter_1.name)
    expect(page).to have_content(shelter_2.name)
  end
end
