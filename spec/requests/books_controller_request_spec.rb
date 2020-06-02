require 'rails_helper'
RSpec.describe "BooksControllers", type: :request do


#completed
  describe "get new_reader_book_path" do
    it "renders the :new template" do
      reader = FactoryBot.create(:reader)
      book = FactoryBot.create(:book)
      get new_reader_book_path(reader_id: reader.id)
      expect(response.status).to eq(200)
    end
  end

#completed
  describe "get edit_reader_book_path" do
    it "renders the :edit template" do
      reader = FactoryBot.create(:reader)
      book = FactoryBot.create(:book)
      get edit_reader_book_path(reader_id: reader.id, id: book.id)
      expect(response.status).to eq(200)
    end
  end

  describe "post reader_books_path with valid data" do
    it "saves a new book and redirects to the show path for the reader" do
      reader = FactoryBot.create(:reader)
      book_attributes = FactoryBot.attributes_for(:book)
      expect { post reader_books_path, {book: book_attributes }}.to change(Book, :count)
    expect(response).to redirect_to reader_path(id: reader.id)
    end
  end


  describe "post reader_books_path with invalid data" do
    it "does not save a new entry or redirect" do
        book_attributes = FactoryBot.attributes_for(:book)
        book_attributes.delete(:title)
        expect { post reader_books_path, {book: book_attributes}}.to_not change(Book, :count)
    expect(response.status).to eq(200)
    end
  end

  describe "put reader_book_path with valid data" do
    it "updates a book and redirects to the show path for the reader" do
      reader = FactoryBot.create(:reader)
      book = FactoryBot.create(:book)
      put reader_book_path(id: book.id), params: {book: { title: "Cat's Cradle"}}
      book.reload
      expect(book.title).to eq("Cat's Cradle")
     expect(response).to redirect_to reader_path(reader_id: reader.id, id: book.id)
    end
  end

#completed
  describe "delete a book record" do
    it "deletes a book record" do
      reader = FactoryBot.create(:reader)
      book = FactoryBot.create(:book)
      expect { book.destroy }.to change(Book, :count).by(-1)

    end
  end

end
