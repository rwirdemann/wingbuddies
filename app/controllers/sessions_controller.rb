class SessionsController < ApplicationController
  def index
    unless current_user.nil?
      friends = Friendship.where("user_id = ?", current_user.id).map { |f| f.friend_id }
      sessions = Session.order(:day).where(
        "visibility = ? OR user_id = ? OR user_id IN (?)", "public", current_user.id, friends)
    else        
      sessions = Session.order(:day).where("visibility = ?", "public") 
    end

    @pagy, @sessions = pagy(sessions)
    @spots = Spot.order(:name)
    @session = Session.new(:day => Date.today)
    @user = User.new
    respond_to do |format|
      format.html
      format.json {
        render json: {entries: render_to_string(partial: "sessions", formats: [:html]), 
                      pagination: view_context.pagy_bulma_nav(@pagy)}
      }
    end
  end

  def create
    @session = Session.new(session_params)    
    if params[:spotname].present?
      spot = Spot.create(:name => params[:spotname])
      @session.spot = spot
    end
    @session.user = current_user
    @session.visibility = params[:visibility]

    if @session.save
      redirect_to sessions_path
    end
  end

  def join
    session = Session.find(params[:id])
    session.users << current_user
    redirect_to sessions_path
  end

  def unjoin
    session = Session.find(params[:id])
    session.users.delete(current_user)
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
