# User Story 4, Shelter Creation
#
# As a visitor
# When I visit the Shelter Index page
# Then I see a link to create a new Shelter, "New Shelter"
# When I click this link

# Then I am taken to '/shelters/new' where I  see a form for a new shelter
# When I fill out the form with a new shelter's:
# - name
# - address
# - city
# - state
# - zip
# And I click the button "Create Shelter" to submit the form
# Then a `POST` request is sent to '/shelters',
# a new shelter is created,

# and I am redirected to the Shelter Index page where I see the new Shelter listed.
require "rails_helper"

RSpec.describe "Shelter ID Page", type: :feature do

  it "I see the shelter with that id including the shelter's address" do
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

    visit "/shelters/#{shelter_1.id}"

    expect(page).to have_content(shelter_1.name)
    expect(page).to have_content(shelter_1.address)
    expect(page).to have_content(shelter_1.city)
    expect(page).to have_content(shelter_1.state)
    expect(page).to have_content(shelter_1.zip)
  end
end
