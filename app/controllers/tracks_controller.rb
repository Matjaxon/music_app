class TracksController < ApplicationController
  def new
    @track = Track.new
    @bands = Band.all
    @albums = Album.all
  end

  def create
    @track = Track.new(track_params)
    if @track.save
      redirect_to album_url(@track.album)
    else
      flash.now[:errors] ||= []
      flash.now[:errors] << @track.errors.full_messages
      @bands = Band.all
      @albums = Album.all
      render :new
    end
  end

  def show
  end

  def edit
  end

  private

  def track_params
    params.require(:track).permit(:title, :album_id, :track_type, :lyrics)
  end
end
