# User Story 12, Pet Delete
#
# As a visitor
# When I visit a pet show page
# Then I see a link to delete the pet "Delete Pet"
# When I click the link
# Then a 'DELETE' request is sent to '/pets/:id',
# the pet is deleted,
# and I am redirected to the pet index page where I no longer see this pet

require 'rails_helper'

RSpec.describe "Delete a Pet" do
  it "can delete a pet" do
    shelter_1 = Shelter.create(name: "Dan's Dogs",
                               address: "123 Main Street",
                               city: "Denver",
                               state: "CO",
                               zip: "80120")
    pet_1 = shelter_1.pets.create!({image: "image01.jpg",
                               name: "Hudson",
                               age: 14,
                               sex: "male"})
    pet_2 = shelter_1.pets.create!({image: "image02.jpg",
                               name: "Kaiser",
                               age: 12,
                               sex: "male"})

    visit "pets/#{pet_1.id}"
    click_on "Delete Pet"
    # expect pet1 to not have name
  end
end
