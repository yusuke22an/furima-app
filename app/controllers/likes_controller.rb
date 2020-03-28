class LikesController < ApplicationController
  before_action :set_item
  
  def create
    @like = Like.create(user_id: current_user.id, item_id: params[:item_id])
  end

  def destroy
    @like = Like.find_by(item_id: params[:item_id], user_id: current_user.id)
    @like.destroy
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
  
end
