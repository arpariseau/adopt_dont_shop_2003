require 'rails_helper'

describe Pet, type: :model do
  describe "validations" do
    it { should validate_presence_of :name }
  end
  describe "relationships" do
    it { should belong_to :shelter}
  end
  describe "methods" do
    before :each do
      shelter_1 = Shelter.create(name: "Dumb Friends League",
                                 address: "2080 S. Quebec St.",
                                 city: "Denver",
                                 state: "CO",
                                 zip: "80231")

      @cassidy = Pet.create(image: "cute_dog.jpg",
                         name: "Cassidy",
                         description: "A very adorable pupper.",
                         approx_age: 10,
                         sex: "F",
                         adopt_status: 'pending',
                         shelter_id: shelter_1.id)

      @hobbes = Pet.create(image: "smug_cat.jpg",
                         name: "Hobbes",
                         description: "A very mischievous cat.",
                         approx_age: 5,
                         sex: "M",
                         adopt_status: 'adoptable',
                         shelter_id: shelter_1.id)
    end
    it "#is_adoptable?" do
      expect(@cassidy.is_adoptable?).to eq(false)
      expect(@hobbes.is_adoptable?).to eq(true)
    end
  end
end
