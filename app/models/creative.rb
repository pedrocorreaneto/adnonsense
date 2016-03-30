class Creative < ActiveRecord::Base
  belongs_to :ad
  validates :bid, numericality: {greater_than: 0}
  validates :adtext, presence: true
  validate :bid_less_than_budget

  def bid_less_than_budget
    return if self.bid == nil
    if self.bid > self.ad.budget
      errors.add(:bid, "Bid is greater than budget")
    end
  end
end
