class SessionsController < ApplicationController
  def index
    @sessions = Session.order(:day)
    @session = Session.new
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
      params.require(:session).permit(:spot, :day)
    end
end
