require 'rails_helper'

RSpec.describe "Shelter index page", type: :feature do
  before :each do
    @shelter_1 = Shelter.create(name: "Dumb Friends League",
                               address: "2080 S. Quebec St.",
                               city: "Denver",
                               state: "CO",
                               zip: "80231")

    @shelter_2 = Shelter.create(name: "Denver Animal Shelter",
                               address: "1241 W. Bayaud Ave.",
                               city: "Denver",
                               state: "CO",
                               zip: "80223")

    visit "/shelters"
  end

  it "shows user all shelters on index visit" do
    expect(page).to have_content(@shelter_1.name)
    expect(page).to have_content(@shelter_2.name)
  end

  it "has an edit link for each shelter on the index" do
    click_button "Edit #{@shelter_1.name}"
    expect(current_path).to eq("/shelters/#{@shelter_1.id}/edit")
  end

  it "has a delete link for each shelter on the index" do
    click_button "Delete #{@shelter_2.name}"
    expect(page).to have_content(@shelter_1.name)
    expect(page).to_not have_content(@shelter_2.name)
  end

  it "has a link for each shelter in their name" do
    click_link "#{@shelter_1.name}"
    expect(current_path).to eq("/shelters/#{@shelter_1.id}")

    visit "/shelters"
    click_link "#{@shelter_2.name}"
    expect(current_path).to eq("/shelters/#{@shelter_2.id}")
  end

end
