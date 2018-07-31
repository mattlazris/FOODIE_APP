class PagesController < ApplicationController

  def home
  end

  def profile
    if user_signed_in?
      @user = current_user
    else
      redirect_to new_user_session_path
    end
  end

  def host
    @host = User.find(params[:id])
  end
end
