# User Story 11, Pet Update
#
# As a visitor
# When I visit a Pet Show page
# Then I see a link to update that Pet "Update Pet"
# When I click the link
# I am taken to '/pets/:id/edit' where I see a form to edit the pet's data including:
# - image
# - name
# - description
# - approximate age
# - sex
# When I click the button to submit the form "Update Pet"
# Then a `PATCH` request is sent to '/pets/:id',
# the pet's data is updated,
# and I am redirected to the Pet Show page where I see the Pet's updated information
require "rails_helper"

RSpec.describe "Pet Update", type: :feature do
  it "I am redirected to the Pet Show page where I see the Pet's updated information" do
    shelter_1 = Shelter.create!(name: "Dan's Dogs",
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

    visit "/pets/#{pet_1.id}"
    click_link "Update Pet"
    expect(current_path).to eq("/pets/#{pet_1.id}/edit")
    fill_in :name, with: "Hudson Updated"
    click_on "Update Pet"
    expect(current_path).to eq("/pets/#{pet_1.id}")
    expect(page).to have_content("Hudson Updated")
  end
end
