class Book < ApplicationRecord
  has_many :tracks
  has_many :readers, through: :tracks

  # validates_presence_of :tracks
  accepts_nested_attributes_for :tracks
  validates_presence_of :title
  validates_presence_of :author

  #validates :title, presence: true
  #validates_uniqueness_of :title, scope: :reader
  # validates :title, uniqueness: { scope: :reader_id }

  #validates :author, presence: true

  TITLES = ["Becoming", "Dare to Lead"]

  def self.title
  two_d = []
  TITLES.each do |f|
    two_d << [f,f]
  end
  return two_d
end



end
