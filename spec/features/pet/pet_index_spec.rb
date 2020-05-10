require 'rails_helper'

RSpec.describe "Pets index page", type: :feature do
  before :each do
    @shelter_1 = Shelter.create(name: "Dumb Friends League",
                               address: "2080 S. Quebec St.",
                               city: "Denver",
                               state: "CO",
                               zip: "80231")

    @cassidy = Pet.create(image: "cute_dog.jpg",
                       name: "Cassidy",
                       description: "A very adorable pupper.",
                       approx_age: 10,
                       sex: "female",
                       adopt_status: 'pending',
                       shelter_id: @shelter_1.id)

    @hobbes = Pet.create(image: "smug_cat.jpg",
                       name: "Hobbes",
                       description: "A very mischievous cat.",
                       approx_age: 5,
                       sex: "male",
                       adopt_status: 'adoptable',
                       shelter_id: @shelter_1.id)

    visit "/pets"
  end

  it "shows user all pets on index visit" do
    expect(page).to have_content(@cassidy.name)
    expect(page).to have_content(@cassidy.approx_age)
    expect(page).to have_content(@cassidy.sex)
    expect(page).to have_content(@shelter_1.name)
    expect(page).to have_content(@hobbes.name)
    expect(page).to have_content(@hobbes.approx_age)
    expect(page).to have_content(@hobbes.sex)
  end

  it "has an edit link for each pet on index visit" do
    click_button "Edit #{@cassidy.name}"
    expect(current_path).to eq("/pets/#{@cassidy.id}/edit")
  end

  it "has a delete link for each pet on index visit" do
    click_button "Delete #{@hobbes.name}"
    expect(page).to have_content(@cassidy.name)
    expect(page).to_not have_content(@hobbes.name)
  end

end
