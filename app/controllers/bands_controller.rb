class BandsController < ApplicationController
  before_action :logged_in?

  def index
    @bands = Band.all
  end

  def new
    @band = Band.new
  end

  def create
    @band = Band.new(band_params)
    if @band.save
      redirect_to band_url(@band)
    else
      flash.now[:errors] ||= []
      flash.now[:errors] << @band.errors.full_messages
      render :new
    end
  end

  def show
    @band = Band.find(params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def band_params
    params.require(:band).permit(:name)
  end
end
