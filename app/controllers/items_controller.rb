class ItemsController < ApplicationController
  def index
  end

  # 商品出品用のアクション
  def new
    #@parents = Category.all.order("id ASC").limit(69)
    @items = Item.new
  end

  def create
    @item = Item.new(create_params)
    # binding.pry
      if @item.save!
        redirect_to controller: :items, action: :index ,notice: "投稿完了しました"
      else
        render :new
      end        
  end
  
  # 商品購入機能用のアクション（仮）
  def update
  end

private
  def create_params
    params.require(:item).permit(:name, :text, :status, :shipping_charges, :shipping_area, :days_to_ship, :price, photos:[]).merge(saler_id: current_user.id)
  end
end