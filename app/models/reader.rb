class Reader < ApplicationRecord
  has_many :tracks, dependent: :destroy
  has_many :books, through: :tracks

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :email, uniqueness: true
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i

  accepts_nested_attributes_for :books


end
