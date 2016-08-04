class AlbumsController < ApplicationController

  def index
    @albums = Album.includes(:band).all
  end

  def new
    @album = Album.new
    @bands = Band.all
  end

  def create
    @album = Album.new(album_params)
    if @album.save
      redirect_to album_url(@album)
    else
      flash.now[:errors] ||= []
      flash.now[:errors] << @album.errors.full_messages
      @bands = Band.all
      render :new
    end
  end

  def show
    @album = Album.includes(:band).find_by(id: params[:id])
  end

  private

  def album_params
    params.require(:album).permit(:title, :band_id, :recording_type)
  end

end
