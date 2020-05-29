class Reader < ApplicationRecord
  has_many :tracks, dependent: :destroy
  has_many :books, through: :tracks

  accepts_nested_attributes_for :books
  
end
