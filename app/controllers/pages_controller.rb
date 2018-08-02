class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :host ]
  before_action :find_current_user, only: [ :profile ]

  def profile
  end

  def host
    @meal = Meal.find(params[:id])
    @host = @meal.user
  end

  private
  def find_current_user
    if user_signed_in?
      @user = current_user
    else
      redirect_to new_user_session_path
    end
  end
end
