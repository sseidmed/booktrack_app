class ReadersController < ApplicationController

  rescue_from ActiveRecord::RecordNotFound, with: :catch_not_found
  before_action :set_reader, only: [:show, :edit, :update, :destroy]

  def index
    @readers = Reader.all
    @books = Book.all
  end


  def new
    @reader = Reader.new
  end

  def show
    @reader = Reader.find(params[:id])
    @books = @reader.books
  end

  def create
      @reader = Reader.new(reader_params)
      if @reader.save
        # flash.notice = "The order record was created successfully."
        redirect_to @reader
      else
        flash.now.alert = @reader.errors.full_messages.to_sentence
        render :new
      end
    end

    def edit
    end

    def update
      if @reader.update(reader_params)
        flash.notice = "The reader record was updated successfully."
        redirect_to @reader
      else
        flash.now.alert = @reader.errors.full_messages.to_sentence
        render :edit
      end
    end

    def destroy
      @reader.destroy
      respond_to do |format|
        format.html { redirect_to readers_url, notice: 'Reader was successfully destroyed.' }
        format.json { head :no_content }
      end
    end



    private


    def set_reader
      @reader = Reader.find(params[:id])
    end

    def reader_params
      params.require(:reader).permit(:first_name, :last_name, :email, tracks_attributes: [ :id, :shelf, :review ])
    end

    def catch_not_found(e)
      Rails.logger.debug("We had a not found exception.")
      flash.alert = e.to_s
      redirect_to readers_path
    end

end
