class StaticPagesController < ApplicationController

  def home
    if signed_in?
      redirect_back_or current_user
    end
  end
  
end
