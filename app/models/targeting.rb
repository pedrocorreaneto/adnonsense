class Targeting < ActiveRecord::Base
  belongs_to :ad
  enum gender: [ :undefined , :male, :female ]
  #validates :gender, inclusion: {in: %w(:gender)}
end
