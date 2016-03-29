class Ad < ActiveRecord::Base
  has_many :creatives
  has_many :targetings
end
