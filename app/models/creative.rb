class Creative < ActiveRecord::Base
  attr_accessor :budget

  belongs_to :ad
  validates :bid, presence: true, numericality: {greater_than: 0}
  validates :adtext, presence: true
  validate :bid_less_than_budget

  def bid_less_than_budget
    return if self.bid == nil
    if bid > budget.to_f
      errors.add(:bid, "Bid is greater than budget")
    end
  end
end
