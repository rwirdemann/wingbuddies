class ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token

  helper_method :current_user, :active_menu

  def current_user
    User.find_by(id: session[:user_id])
  end

  def active_menu(controller)
    if params[:controller] == controller 
      return 'has-background-primary'
    end
    ""
  end
end