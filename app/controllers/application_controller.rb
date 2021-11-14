class ApplicationController < ActionController::Base
  skip_before_filter :verify_authenticity_token
  
  helper_method :current_user

  def current_user
    User.find_by(id: session[:user_id])
  end
end