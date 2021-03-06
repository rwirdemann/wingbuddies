class ApplicationController < ActionController::Base
  include Pagy::Backend
  skip_before_action :verify_authenticity_token

  helper_method :current_user, :active_menu

  def current_user
      User.find_by(id: session[:user_id])
  end

  def active_menu(controller, action = nil)
    if params[:controller] == controller and (action.nil? or params[:action] == action)
      return 'has-background-primary'
    end
    ""
  end
end