require 'rails_helper'
RSpec.describe "ReadersControllers", type: :request do

  describe "get readers_path" do
    it "renders the index view" do
      FactoryBot.create_list(:reader, 10)
      get readers_path
      expect(response.status).to eq(200)
    end
  end

  describe "get reader_path" do
    it "renders the :show template" do
      reader = FactoryBot.create(:reader)
      get reader_path(id: reader.id)
      expect(response.status).to eq(200)
    end

    it "redirects to the index path if the customer id is invalid" do
      get reader_path(id: 5000) #an ID that doesn't exist
      expect(response).to redirect_to readers_path
    end
  end

#completed
  describe "get new_reader_path" do
    it "renders the :new template" do
      reader = FactoryBot.create(:reader)
      get new_reader_path(id: reader.id)
      expect(response.status).to eq(200)
    end
  end

#completed
  describe "get edit_reader_path" do
    it "renders the :edit template" do
      reader = FactoryBot.create(:reader)
      get edit_reader_path(id: reader.id)
      expect(response.status).to eq(200)
    end
  end

  describe "post readers_path with valid data" do
    it "saves a new entry and redirects to the show path for the entry" do
      reader_attributes = FactoryBot.attributes_for(:reader)
      expect { post readers_path, {reader: reader_attributes}}.to change(Reader, :count)
    expect(response).to redirect_to reader_path(id: Reader.last.id)
    end
  end


  describe "post readers_path with invalid data" do
    it "does not save a new entry or redirect" do
        reader_attributes = FactoryBot.attributes_for(:reader)
        reader_attributes.delete(:email)
        expect { post readers_path, {reader: reader_attributes}}.to_not change(Reader, :count)
    expect(response.status).to eq(200)
    end
  end

  describe "put reader_path with valid data" do
    it "updates an entry and redirects to the show path for the reader" do
      reader = FactoryBot.create(:reader)
      put reader_path(id: reader.id), params: {reader: { email: "example@example.com"}}
      reader.reload
      expect(reader.email).to eq("example@example.com")
     expect(response).to redirect_to reader_path(id: reader.id)
    end
  end

#completed
  describe "delete a reader record" do
    it "deletes a reader record" do
      reader = FactoryBot.create(:reader)
      expect { reader.destroy }.to change(Reader, :count).by(-1)

    end
  end

end
