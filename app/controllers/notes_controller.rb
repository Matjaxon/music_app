class NotesController < ApplicationController
  def new
    @note = Note.new
    @track = Track.find(params[:track_id])
  end

  def create
    @note = Note.new(note_params)
    @note[:user_id] = current_user.id
    if @note.save
      redirect_to track_url(@note.track_id)
    else
      @track = Track.find(params[:track_id])
      flash[:errors] ||= []
      flash[:errors] << @note.errors.full_messages
      redirect_to track_url(@note.track_id)
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def note_params
    params.require(:note).permit(:track_id, :note_body)
  end
end
