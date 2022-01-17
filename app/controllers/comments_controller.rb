class CommentsController < ApplicationController
  def create
    @session = Session.find(params[:session_id])
    @comment = @session.comments.create(comment_params)
    redirect_to session_path(@session)
  end

  def destroy
    @session = Session.find(params[:session_id])
    @comment = @session.comments.find(params[:id])
    @comment.destroy
    redirect_to session_path(@session)
  end

  private

  def comment_params
    params.require(:comment).permit(:commenter, :body)
  end
end
