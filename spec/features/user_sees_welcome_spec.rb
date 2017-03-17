require_relative "../spec_helper"

RSpec.describe "When a user visits '/' " do
  it "they see a welcome message" do
    # as a user
    # when I visit '/'
    visit "/"
    # I expect to see "Welcome!" in an h2
    within("h2.title") do
      expect(page).to have_content("Welcome!")
    end
    # and I expect to see a link to "All Horses"
    expect(page).to have_content("All Horses")
  end
end
