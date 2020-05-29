class Track < ApplicationRecord
  belongs_to :reader
  belongs_to :book
  

  SHELVES = ["Read", "Currently Reading", "Want to Read"]

  def self.shelf
    two_d = []
    SHELVES.each do |f|
      two_d << [f,f]
    end
    return two_d
  end

end
