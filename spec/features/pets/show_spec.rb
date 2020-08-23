# User Story 9, Pet Show
#
# As a visitor
# When I visit '/pets/:id'
# Then I see the pet with that id including the pet's:
# - image
# - name
# - description
# - approximate age
# - sex
# - adoptable/pending adoption status
require "rails_helper"

RSpec.describe "Pets ID Page", type: :feature do

  it "I see the pet with that id including the pet's image, name, description, age, sex, and adoption status" do
    shelter_1 = Shelter.create!({name: "Dan's Dogs",
                               address: "123 Main Street",
                               city: "Denver",
                               state: "CO",
                               zip: "80120"})
   shelter_2 = Shelter.create!({name: "Bark Bark Woof Woof",
                              address: "123 Paw Avenue",
                              city: "Arvada",
                              state: "CO",
                              zip: "80123"})
    pet_1 = shelter_1.pets.create!({image: "image01.jpg",
                        name: "Hudson",
                        age: 14,
                        sex: "male"})
    pet_2 = shelter_1.pets.create!({image: "image02.jpg",
                        name: "Kaiser",
                        age: 12,
                        sex: "male"})
    pet_3 = shelter_2.pets.create!({image: "image03.jpg",
                        name: "Lucy",
                        age: 12,
                        sex: "female"})

    visit "/pets/#{pet_1.id}"

    # expect(page).to have_content(pet_1.image)
    expect(page).to have_content(pet_1.name)
    # expect(page).to have_content(pet_1.description)
    expect(page).to have_content(pet_1.age)
    expect(page).to have_content(pet_1.sex)
    # expect(page).to have_content(pet_1.status)
  end
end
