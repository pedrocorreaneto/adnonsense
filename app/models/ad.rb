class Ad < ActiveRecord::Base
  has_many :creatives
  has_many :targetings
  validates :budget, numericality: {greater_than: 0}
end
