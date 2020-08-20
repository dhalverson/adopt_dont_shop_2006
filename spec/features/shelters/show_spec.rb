# User Story 3, Shelter Show
#
# As a visitor
# When I visit '/shelters/:id'
# Then I see the shelter with that id including the shelter's:- name
# - address
# - city
# - state
# - zip
require "rails_helper"

describe "Shelter ID Page", type: :feature do

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
