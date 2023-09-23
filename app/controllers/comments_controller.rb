class CommentsController < ApplicationController
  def create
    Comment.create(prototype_params)
    redirect_to "prototype_path#{comment.prototype.id}"
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, prototype_id: params[:prototype_id])
  end
end
