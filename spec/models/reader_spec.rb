require 'rails_helper'

RSpec.describe Reader, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  subject { Reader.new(first_name: "Arya", last_name: "Stark", email: "arya@sample.com" )}

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without a first_name" do
    subject.first_name=nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a last_name" do
    subject.last_name=nil
    expect(subject).to_not be_valid
  end

  it "is not valid without an email" do
  subject.email=nil
    expect(subject).to_not be_valid
  end

  it "is not valid if the email address doesn't have a @" do
  subject.email = 'example.com'
    expect(subject).to_not be_valid
  end
end
