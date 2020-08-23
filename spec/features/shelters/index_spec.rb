# User Story 2, Shelter Index
#
# As a visitor
# When I visit '/shelters'
# Then I see the name of each shelter in the system
require "rails_helper"

RSpec.describe "Shelter Index Page", type: :feature do

  it "I see the name of each shelter in the system" do
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

    visit "/shelters"

    expect(page).to have_content(shelter_1.name)
    expect(page).to have_content(shelter_2.name)
  end
end
