class Book < ApplicationRecord
  has_many :tracks
  has_many :readers, through: :tracks

  accepts_nested_attributes_for :tracks

  #validates :title, presence: true
  #validates_uniqueness_of :id, scope: :reader_id, allow_blank: false
  #validates :title, uniqueness: { scope: :reader_id }

  #validates :author, presence: true

  TITLES = []

  def self.titles
  two_d = []
  TITLE.each do |f|
    two_d << [f,f]
  end
  return two_d
end



end
