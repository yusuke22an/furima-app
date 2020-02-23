class ItemsController < ApplicationController
  def index
  end

# 商品出品用のアクション
  def new
    @item = Item.new
  end

  def create
    @item = Item.create params.require(:item).permit(:name, :text, :status, :shipping_charges, :shipping_area, :days_to_ship, :price).merge(seller_id: current_user.id)
    redirect_to root_path
  end

# 商品購入機能用のアクション（仮）
  def update
  end

end
