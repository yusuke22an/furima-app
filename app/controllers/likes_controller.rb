class LikesController < ApplicationController
  before_action :set_item
  
  def create
    @like = Like.new(user_id: current_user.id, item_id: params[:item_id])
    flash.now[:alert] = "いいね!登録エラー" unless @like.save
  end

  def destroy
    @like = Like.find_by(item_id: params[:item_id], user_id: current_user.id)
    flash.now[:alert] = "いいね!削除エラー" unless @like.destroy
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
  
end
