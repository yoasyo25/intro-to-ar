require_relative "../spec_helper"

RSpec.describe "As a user tries to create a horse" do
  it "they can enter horse attributes and see it on the next page" do
    # As a user
    # When i visit "/horses/new"
    visit "/horses/new"
    # And I fill in a horses name with "Betty"
    fill_in("horse[name]", with: "Betty")
    # And I fill in a horses age with "3"
    fill_in "horse[age]", with: 3
    # And I fill in a horses total_winnings with "12"
    fill_in "horse[total_winnings]", with: 12
    # And I click "Submit"
    click_on "Submit"
    # Then I expect to be taken to "/horses"
    expect( current_path ).to eq("/horses")
    # And then I expect to see "Betty"
    # And then I expect to see "Age: 3"
    # And then I expect to see "Total Winnings: 12"
    within(".horse-info") do
      expect(page).to have_content("Betty")
      expect(page).to have_content("Age: 3")
      expect(page).to have_content("Total Winnings: 12")
    end
  end
end
