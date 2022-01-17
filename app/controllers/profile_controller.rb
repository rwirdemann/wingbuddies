class ProfileController < ApplicationController

  def index
    @user = current_user
  end

  def my_sessions
    @sessions = Session.order(day: :desc).where('user_id = ?', current_user.id)
  end
end
