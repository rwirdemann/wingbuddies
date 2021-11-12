class SessionsController < ApplicationController
  def index
    @sessions = Session.order(:day)
    @spots = Spot.order(:name)
    @session = Session.new(:day => Date.today)
    @user = User.new
  end

  def create
    @session = Session.new(session_params)
    puts @session

    if @session.save
      redirect_to sessions_path
    end
  end

  private
    def session_params
      params.require(:session).permit(:spot_id, :day)
    end
end
