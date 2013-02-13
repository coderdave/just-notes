class NotesController < ApplicationController
  before_filter :signed_in_user
  before_filter :correct_user, only: :destroy

  respond_to :html, :js, :json

  # cache_sweeper :note_sweeper

  def new
    @note = current_user.notes.new
  end

  def create
    @note = current_user.notes.new(params[:note])
    if @note.save
      flash[:notice] = "Note successfully created."
      redirect_to current_user
    else
      render 'new'
    end
  end

  def edit
    @note = Note.find(params[:id])
  end

  def update
    @note = Note.find(params[:id])
    @note.update_attributes(params[:note])
    if @note.save
      flash[:notice] = "Note successfully updated."
      redirect_to current_user
    else
      render 'edit'
    end
  end

  def destroy
    @note = Note.find(params[:id], include: :user)
    @user = @note.user
    @note.destroy
  end

  def index
    title_param = params[:q]
    user_id_param = params[:user_id]
    notes = Note.select{[id, title.as("name")]}.where{title.matches("%#{title_param}%") & user_id.eq("#{user_id_param}")}
    respond_with(notes)
  end

  private

    def correct_user
      @note = current_user.notes.find_by_id(params[:id])
      redirect_to root_path if @note.nil?
    end

end
