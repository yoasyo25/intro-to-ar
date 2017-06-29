class Horse < ActiveRecord::Base
  belongs_to :jockey
  belongs_to :breed

  def self.total_winnings_by_jockey
    sum(:total_winnings)
  end

end
