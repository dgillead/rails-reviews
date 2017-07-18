class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session

  def authorize!
    redirect_to "/login" unless current_user
  end

  def current_user
    User.find(session[:user_id]) if session[:user_id]
  end

  helper_method :current_user
end
