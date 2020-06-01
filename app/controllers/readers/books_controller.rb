class Readers::BooksController < ApplicationController

  rescue_from ActiveRecord::RecordNotFound, with: :catch_not_found
  before_action :set_reader, except: [:index, :show]
  before_action :set_book, only: [:show, :edit, :update, :destroy]


  def index
    @books = Book.all
  end

  def show

  end

  def new
    # @reader = Reader.find(params[:reader_id])
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @track = Track.new(track_params)
    book_saved = @book.save
    track_saved = false
    if book_saved
      @track.book_id = @book.id
      @track.reader_id = @reader.id
      track_saved = @track.save
    end
    respond_to do |format|
     if book_saved && track_saved
        format.html { redirect_to @reader, notice: 'Book was successfully created and added.' }
        format.json { render :show, status: :created, location: @book }
     elsif not book_saved
        format.html { render :new }
        format.json { render json: @book.errors, status: :unprocessable_entity }
     else
       format.html { render :new }
       format.json { render json: @track.errors, status: :unprocessable_entity }
     end
    end
  end




  def edit
  end

  def update
    byebug
    respond_to do |format|

      if @book.update!(book_params)
        format.html { redirect_to @reader, notice: 'Book was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    title = @book.title

    if @book.destroy
      flash[:notice] = "#{title} was deleted successfully."
      redirect_to @reader
    else
      flash[:error] = 'There was an error deleting the book.'
    end
  end


  private

  def book_params
    params.require(:book).permit(:id, :title, :author)
  end


  def track_params
    params.require(:track).permit(:id, :reader_id, :book_id, :shelf, :review)
  end



  def set_book
    @book = Book.find(params[:id])
  end

  def set_reader
    @reader = Reader.find(params[:reader_id])
  end





end
