class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception

  before_action :set_current_user

  private

  def set_current_user
    @current_user = User.find(session[:user_id]) if session[:user_id]
    session[:user_id] = nil unless @current_user.present?
  end

  def current_user?(user)
     @current_user == user
  end

  def categories
   Category.all
  end

  helper_method :categories
  helper_method :current_user?

end
