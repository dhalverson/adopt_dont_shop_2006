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
    pet_1 = Pet.create!({image: "image_placeholder",
                        name: "Hudson",
                        age: 14,
                        sex: "male",
                        shelter_name: "Dan's Dogs"})
    pet_2 = Pet.create!({image: "image_placeholder",
                        name: "Kaiser",
                        age: 12,
                        sex: "male",
                        shelter_name: "Bark Bark Woof Woof"})

    visit "/pets"

    expect(page).to have_content(pet_1.name)
    expect(page).to have_content(pet_2.name)
  end
end
