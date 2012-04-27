class NotesController < ApplicationController

  before_filter :signed_in_user
  before_filter :correct_user,   only: :destroy

  def index
  end

  def show
  end

  def new
  end
  
  def create
    @micropost = current_user.microposts.build(params[:micropost])
    if @micropost.save
      flash[:success] = "Micropost created!"
      redirect_to root_path
    else
      @feed_items = []
      render 'static_pages/home'
    end
  end

  def edit
  end

  def update
    if @note.update_attributes(params[:user])
      flash[:notice] = "Note updated."
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    @note = Note.find(params[:id], include: :user)
    @user = @note.user
    @note.destroy
  end

  private

    def correct_user
      @note = current_user.notes.find_by_id(params[:id])
      redirect_to root_path if @note.nil?
    end

end
