class Score < ActiveRecord::Base
  validates :name, presence: true, length: { maximum: 3, minimum: 3}
  validates :score, presence: true
  attr_accessible :name, :score
end
