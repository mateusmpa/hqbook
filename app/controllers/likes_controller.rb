class LikesController < ApplicationController

  def index
    @like = Like.find(likeable_type: params[:likeable_type], likeable_id: params[:id])
  end

  def create
    @like = Like.create(likeable_type: params[:likeable_type], likeable_id: params[:id], user_id: current_user.id)
    model = params[:likeable_type].constantize.find(params[:id])

    redirect_to model 
  end

  def destroy
    @like = Like.findBy(likeable_type: params[:likeable_type], likeable_id: params[:id], user_id: params[current_user.id])
    @like.destroy
  end

end
