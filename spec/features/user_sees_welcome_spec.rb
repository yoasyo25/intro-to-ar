require_relative '../spec_helper'

describe "When a user visits '/'" do
  it "they see a welcome message" do
    visit '/'

    expect(page).to have_content("Welcome!")
  end
end
