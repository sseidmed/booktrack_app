require 'rails_helper'

RSpec.describe Book, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  subject { Book.new(title: "Educated", author: "Tara Westover")}

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without a title" do
    subject.title=nil
    expect(subject).to_not be_valid
  end

  it "is not valid without an author" do
    subject.author=nil
    expect(subject).to_not be_valid
  end

end
