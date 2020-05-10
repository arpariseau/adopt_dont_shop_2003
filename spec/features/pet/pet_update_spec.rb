require 'rails_helper'

RSpec.describe "Pet update", type: :feature do
  it "updates a pet" do
    shelter_1 = Shelter.create(name: "Dumb Friends League",
                               address: "2080 S. Quebec St.",
                               city: "Denver",
                               state: "CO",
                               zip: "80231")

    pet_1 = Pet.create(image: "cute_dog.jpg",
                       name: "Cassidy",
                       description: "A very adorable pupper.",
                       approx_age: 10,
                       sex: "female",
                       adopt_status: 'pending',
                       shelter_id: shelter_1.id)

      visit "/pets/#{pet_1.id}"
      click_button "Update Pet"
      expect(current_path).to eq("/pets/#{pet_1.id}/edit")

      fill_in :image, with: "smug_cat.jpg"
      fill_in :name, with: "Hobbes"
      fill_in :description, with: "A very mischievous cat."
      fill_in :approx_age, with: 5
      fill_in :sex, with: "male"
      click_button "Update Pet"

      expect(current_path).to eq("/pets/#{pet_1.id}")
      expect(page).to have_content("Hobbes")
      expect(page).to have_content("A very mischievous cat.")
      expect(page).to have_content(5)
      expect(page).to have_content("male")
  end
end
