require 'rails_helper'

RSpec.describe "Pets index page", type: :feature do
  it "shows user all pets on index visit" do
    shelter_1 = Shelter.create(name: "Dumb Friends League",
                               address: "2080 S. Quebec St.",
                               city: "Denver",
                               state: "CO",
                               zip: "80231")

    cassidy = Pet.create(image: "cute_dog.jpg",
                       name: "Cassidy",
                       description: "A very adorable pupper.",
                       approx_age: 10,
                       sex: "F",
                       adopt_status: 'pending',
                       shelter_id: shelter_1.id)

    hobbes = Pet.create(image: "smug_cat.jpg",
                       name: "Hobbes",
                       description: "A very mischievous cat.",
                       approx_age: 5,
                       sex: "M",
                       adopt_status: 'adoptable',
                       shelter_id: shelter_1.id)

    visit "/pets"
    expect(page).to have_content(cassidy.name)
    expect(page).to have_content(cassidy.approx_age)
    expect(page).to have_content(cassidy.sex)
    expect(page).to have_content(shelter_1.name)
    expect(page).to have_content(hobbes.name)
    expect(page).to have_content(hobbes.approx_age)
    expect(page).to have_content(hobbes.sex)
  end
end
