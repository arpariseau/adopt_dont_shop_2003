require 'rails_helper'

RSpec.describe "Pet read page", type: :feature do
  it "shows user pet info on page visit" do
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

    visit "/pets/#{cassidy.id}"
    expect(page).to have_content(cassidy.name)
    expect(page).to have_content(cassidy.description)
    expect(page).to have_content(cassidy.approx_age)
    expect(page).to have_content(cassidy.sex)
    expect(page).to have_content(cassidy.adopt_status)
  end
end
