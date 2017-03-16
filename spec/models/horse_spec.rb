require_relative "../spec_helper"

RSpec.describe Horse do
  describe ".total_winnings" do
    it "returns total winnings for all horses" do
      # Setup
      Horse.create(name: "bob", age: 22, total_winnings: 3)
      Horse.create(name: "stacey", age: 33, total_winnings: 4)

      # Exercise
      result = Horse.total_winnings

      # Verify
      expect( result ).to eq(7)
    end
  end
  describe "validations" do
    it "is invalid without a name" do
      horse = Horse.new(age: 22, total_winnings: 14)

      expect( horse ).to_not be_valid
    end

    it "should be valid with a name" do
      horse = Horse.new(age: 22, total_winnings: 12, name: "Andrew")

      expect(horse).to be_valid
    end
  end
  describe "attributes" do
    it "should have name, age, and total_winnings" do
      horse = Horse.new

      expect(horse).to respond_to(:name, :age, :total_winnings)
      expect(horse).to respond_to(:jockey)
      expect(horse).to respond_to(:breed)
    end
  end
end
