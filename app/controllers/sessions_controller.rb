class SessionsController < ApplicationController
  def index
    @sessions = Session.order(:day)
    @spots = Spot.order(:name)
    @session = Session.new(:day => Date.today)
    @user = User.new
  end

  def create
    @session = Session.new(session_params)
    @session.user = current_user
    if @session.save
      redirect_to sessions_path
    end
  end

  def join
    session = Session.find(params[:id])
    session.users << current_user
    redirect_to sessions_path
  end

  def destroy
    session = Session.find(params[:id])
    session.users.clear
    session.destroy
    
    redirect_to sessions_path
  end

  private
    def session_params
      params.require(:session).permit(:spot_id, :day)
    end
end
