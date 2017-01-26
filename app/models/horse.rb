class Horse < ActiveRecord::Base
  belongs_to :jockey
  belongs_to :breed

  def self.total_winnings
    sum(:total_winnings)
  end

  def self.average_winnings
    average(:total_winnings).round
  end
end
