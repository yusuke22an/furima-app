class LikesController < ApplicationController
  before_action :set_item
  
  def create
    @like = Like.new(user_id: current_user.id, item_id: params[:item_id])
    if @like.save
    else
    end
  end

  def destroy
    @like = Like.find_by(item_id: params[:item_id], user_id: current_user.id)
    if @like.destroy
    else
    end
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
  
end
