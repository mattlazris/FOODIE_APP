class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :host ]
  before_action :find_current_user, only: [ :profile, :favorite, :unfavorite, :saves, :follows ]
  before_action :find_meal, only: [ :favorite, :host, :unfavorite ]

  def profile
  end

  def host
    @host = @meal.user
  end

  def favorite
    @user.favorite @meal
    redirect_to request.referrer
  end

  def unfavorite
    @user.remove_favorite @meal
    redirect_to request.referrer
  end

  def saves
    @meals = current_user.favorited_by_type('Meal')
  end

  def follow
    @user = User.find(params[:user_id])
    current_user.favorite @user
    redirect_to request.referrer
  end

  def unfollow
    @user = User.find(params[:user_id])
    current_user.remove_favorite @user
    redirect_to request.referrer
  end

  def follows
    @users = current_user.favorited_by_type('User')
  end

  private
  def find_current_user
    if user_signed_in?
      @user = current_user
    else
      redirect_to new_user_session_path
    end
  end

  def find_meal
    @meal = Meal.find(params[:meal_id])
  end
end
