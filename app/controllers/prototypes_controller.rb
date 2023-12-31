class PrototypesController < ApplicationController
  before_action :move_to_index, except: [:index, :show]
  before_action :user_confirmation, only: [:edit, :destroy, :update]

  def index
    @prototypes = Prototype.all
  end

  def new
    @prototype =Prototype.new
  end

  def create
    @prototype = Prototype.new(prototype_params)
      if @prototype.save
        redirect_to prototypes_path
      else
        render :new, status: :unprocessable_entity
      end
  end

  def move_to_index    
    unless user_signed_in? 
      redirect_to action: :index
    end
  end

  def user_confirmation
    @prototype = Prototype.find(params[:id])
    unless current_user.id == @prototype.user_id
      redirect_to action: :index
    end
  end

  def show
    @prototype = Prototype.find(params[:id])
    @comment = Comment.new
    @comments = @prototype.comments.includes(:user)
  end

  def edit
  end

  def destroy
    @prototype.destroy
    redirect_to root_path
  end

  def update
    if @prototype.update(prototype_params)
      redirect_to prototype_path(@prototype)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private
  def prototype_params
    params.require(:prototype).permit(:title, :catch_copy, :concept, :image).merge(user_id: current_user.id)
  end
end