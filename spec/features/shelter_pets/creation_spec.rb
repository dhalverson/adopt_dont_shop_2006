# User Story 10, Shelter Pet Creation
#
# As a visitor
# When I visit a Shelter Pets Index page
# Then I see a link to add a new adoptable pet for that shelter "Create Pet"
# When I click the link
# I am taken to '/shelters/:shelter_id/pets/new' where I see a form to add a new adoptable pet
# When I fill in the form with the pet's:
# - image
# - name
# - description
# - approximate age
# - sex ('female' or 'male')
# And I click the button "Create Pet"
# Then a `POST` request is sent to '/shelters/:shelter_id/pets',
# a new pet is created for that shelter,
# that pet has a status of 'adoptable',
# and I am redirected to the Shelter Pets Index page where I can see the new pet listed
require "rails_helper"

RSpec.describe "Shelter Pet Creatopm", type: :feature do

  it "I am taken to '/shelters/:shelter_id/pets/new' where I see a form to add a new adoptable pet" do
    shelter_1 = Shelter.create(name: "Dan's Dogs",
                               address: "123 Main Street",
                               city: "Denver",
                               state: "CO",
                               zip: "80120")
    shelter_2 = Shelter.create(name: "Woof Woof Bark Bark",
                              address: "123 Paw Avenue",
                              city: "Lakewood",
                              state: "CO",
                              zip: "80123")

    visit "/shelters/#{shelter_1.id}/pets"
    click_link "Create Pet"
    expect(current_path).to eq("/shelters/#{shelter_1.id}/pets/new")
    fill_in :name, with: "Larry"
    click_on "Create Pet"
    expect(current_path).to eq("/shelters/#{shelter_1.id}/pets")
    expect(page).to have_content("Larry")
  end
end
