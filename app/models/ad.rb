class Ad < ActiveRecord::Base
  has_many :creatives
  has_many :targetings
  validates :budget, numericality: {greater_than: 0}
  accepts_nested_attributes_for :creatives, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :targetings, reject_if: :all_blank, allow_destroy: true
end
