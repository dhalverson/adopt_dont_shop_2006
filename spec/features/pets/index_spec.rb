# User Story 7, Pet Index
#
# As a visitor
# When I visit '/pets'
# Then I see each Pet in the system including the Pet's:
# - image
# - name
# - approximate age
# - sex
# - name of the shelter where the pet is currently located

require "rails_helper"

RSpec.describe "Pets Index Page", type: :feature do

  it "I see the name of each pet in the system" do
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

    visit "/pets"

    # expect(page).to have_css('img', text: "image1.jpg")
    expect(page).to have_content(pet_1.name)
    expect(page).to have_content(pet_1.age)
    expect(page).to have_content(pet_1.sex)


    expect(page).to have_content(pet_2.name)
  end
end
