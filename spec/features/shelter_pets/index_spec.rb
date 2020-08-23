# User Story 8, Shelter Pets Index
#
# As a visitor
# When I visit '/shelters/:shelter_id/pets'
# Then I see each Pet that can be adopted from that Shelter with that shelter_id including the Pet's:
# - image
# - name
# - approximate age
# - sex

require "rails_helper"

RSpec.describe "Shelter Pets Index Page", type: :feature do

  it "I see each Pet that can be adopted from that Shelter with that shelter_id" do
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

    visit "/shelters/#{shelter_1.id}/pets"

    # expect(page).to have_css('img', text: "image1.jpg")
    expect(page).to have_content(pet_1.name)
    expect(page).to have_content(pet_1.age)
    expect(page).to have_content(pet_1.sex)
  end
end
