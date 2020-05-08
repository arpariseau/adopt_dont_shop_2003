require 'rails_helper'

RSpec.describe "Pets index page", type: :feature do
  it "shows user all pets on index visit" do
    shelter_1 = Shelter.create(name: "Dumb Friends League",
                               address: "2080 S. Quebec St.",
                               city: "Denver",
                               state: "CO",
                               zip: "80231")

    pet_1 = Pet.create(image: "cute_dog.jpg",
                       name: "Cassidy",
                       approx_age: 10,
                       sex: "F",
                       adopt_status: 'pending',
                       shelter_id: shelter_1.id)

    pet_2 = Pet.create(image: "smug_cat.jpg",
                       name: "Hobbes",
                       approx_age: 5,
                       sex: "M",
                       adopt_status: 'adoptable',
                       shelter_id: shelter_1.id)

    visit "/pets"
    expect(page).to have_content(pet_1.name)
    expect(page).to have_content(pet_1.approx_age)
    expect(page).to have_content(pet_1.sex)
    expect(page).to have_content(shelter_1.name)
    expect(page).to have_content(pet_2.name)
    expect(page).to have_content(pet_2.approx_age)
    expect(page).to have_content(pet_2.sex)
  end
end
