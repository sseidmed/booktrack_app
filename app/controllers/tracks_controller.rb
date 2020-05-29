class TracksController < ApplicationController
  
  before_action :set_track, only: [:show, :edit, :update, :destroy]

  def index
    @tracks = @reader.tracks
  end

  def show
  end

  def new
    @track = @reader.tracks.build
  end

  def create
   @track = @reader.tracks.build(track_params)

       respond_to do |format|
        if @post.save
           format.html { redirect_to reader_tracks_path(@reader), notice: 'Book was successfully created and added.' }
           format.json { render :show, status: :created, location: @tracl }
        else
           format.html { render :new }
           format.json { render json: @track.errors, status: :unprocessable_entity }
     end
   end
  end

  def edit
  end

  def update
  respond_to do |format|
    if @track.update(post_params)
      format.html { redirect_to reader_track_path(@reader), notice: 'Book was successfully updated.' }
      format.json { render :show, status: :ok, location: @track }
    else
      format.html { render :edit }
      format.json { render json: @track.errors, status: :unprocessable_entity }
    end
  end
end


  def destroy
    @track.destroy
     respond_to do |format|
      format.html { redirect_to reader_tracks_path(@reader), notice: 'Book was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private


    def set_track
      @track = @reader.tracks.find(params[:id])
    end

    def post_params
      params.require(:track).permit(:shelf, :review, :reader_id, :book_id)
    end

end
