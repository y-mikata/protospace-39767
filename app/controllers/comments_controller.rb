class CommentsController < ApplicationController
  def create
    @prototype = Prototype.find(params[:prototype_id])
    comment = @prototype.comments.create(comment_params)
    redirect_to prototype_path(@prototype)
  end

  private
  def comment_params
    params.require(:comment).permit(:content).merge(user_id: current_user.id, prototype_id: params[:prototype_id])
  end
end
