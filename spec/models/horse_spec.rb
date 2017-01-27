require_relative '../spec_helper'

describe Horse do
  describe '.total_winnings' do
    it 'returns total winnings for all horses' do
      Horse.create(name: "Phil", age: 22, total_winnings: 3)
      Horse.create(name: "Penelope", age: 24, total_winnings: 4)

      expect(Horse.total_winnings).to eq(7)
    end
  end

  describe 'validations' do
    it 'is valid with valid attributes' do
      horse = Horse.new(name: "George")

      expect(horse).to be_valid
    end

    it 'validates presence of name' do
      horse = Horse.new(age: 22, total_winnings: 4)

      expect(horse).to_not be_valid
    end
  end

end
