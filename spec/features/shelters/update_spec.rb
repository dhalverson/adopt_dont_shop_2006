
  # User Story 5, Shelter Update
  #
  # As a visitor
  # When I visit a shelter show page
  # Then I see a link to update the shelter "Update Shelter"

  # When I click the link "Update Shelter"
  # Then I am taken to '/shelters/:id/edit' where I  see a form to edit the shelter's data including:
  # - name
  # - address
  # - city
  # - state
  # - zip
  # When I fill out the form with updated information
  # And I click the button to submit the form
  # Then a `PATCH` request is sent to '/shelters/:id',
  # the shelter's info is updated,

  # and I am redirected to the Shelter's Show page where I see the shelter's updated info
require "rails_helper"

  describe "Shelter Update", type: :feature do
    it "I am redirected to the Shelter's Show page where I see the shelter's updated info" do
      shelter_1 = Shelter.create(name: "Dan's Dogs",
                                 address: "123 Main Street",
                                 city: "Denver",
                                 state: "CO",
                                 zip: "80120")

      visit "/shelters/#{shelter_1.id}"
      click_link "Update Shelter"
      expect(current_path).to eq("/shelters/#{shelter_1.id}/edit")

      fill_in :name, with: "Dan's Doggies"
      fill_in :address, with: "456 Main Street"
      fill_in :city, with: "Arvada"
      fill_in :state, with: "CO"
      fill_in :zip, with: "80120"
      click_on "Update Shelter"

      expect(current_path).to eq("/shelters/#{shelter_1.id}")
      expect(page).to have_content("Dan's Doggies")
      expect(page).to have_content("456 Main Street")
      expect(page).to have_content("Arvada")
      expect(page).to have_content("CO")
      expect(page).to have_content("80120")
    end
  end
