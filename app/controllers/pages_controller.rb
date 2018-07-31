class PagesController < ApplicationController

  def home
  end

  def profile
    if user_signed_in?
      @user = current_user
    end
  end
end
