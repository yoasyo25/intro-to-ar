require_relative '../spec_helper'

describe Horse do
  describe '.total_winnings' do
    it 'returns total winnings for all horses' do
      Horse.create(name: "Phil", age: 22, total_winnings: 3)
      Horse.create(name: "Penelope", age: 24, total_winnings: 4)

      expect(Horse.total_winnings).to eq(7)
    end

    it 'returns total winnings for the horses of a single jockey' do
      jockey_1 = Jockey.create(name: "Chava")
      jockey_2 = Jockey.create(name: "Penelope")
      jockey_1.horses.create(name: "Chuy", age: 22, total_winnings: 3)
      jockey_1.horses.create(name: "Chema", age: 24, total_winnings: 4)
      jockey_2.horses.create(name: "Pecos", age: 25, total_winnings: 8)

      expect(jockey_1.horses.total_winnings).to eq(7)
    end
  end

  describe '.average_winnings' do
    it "returns the average winnings for all Horses" do
      Horse.create(name: "Chuy", age: 22, total_winnings: 3)
      Horse.create(name: "Chindo", age: 24, total_winnings: 5)

      expect(Horse.average_winnings).to eq(4)
    end
  end

  describe 'validations' do
    it 'is valid with valid attributes' do
      horse = Horse.new(name: "George", age: 22, total_winnings: 3)

      expect(horse).to be_valid
    end

    it 'validates presence of name' do
      horse = Horse.new(age: 22, total_winnings: 4)

      expect(horse).to_not be_valid
    end

    it 'validates presence of age' do
      horse = Horse.new(name: "Penelope", total_winnings: 4)

      expect(horse).to_not be_valid
    end

    it 'validates presence of age' do
      horse = Horse.new(name: "Penelope", age: 22)

      expect(horse).to_not be_valid
    end

    it 'validates uniqueness of name' do
      Horse.create(name: "Chuy", age: 22, total_winnings: 3)
      horse = Horse.create(name: "Chuy", age: 44, total_winnings: 4)

      expect(horse).to_not be_valid
    end
  end

end
