class ItemsController < ApplicationController

  def index
    @categories = Category.all
  end

  # 商品出品用のアクション
  def new
    @item = Item.new    
    @category_parent_array = Category.where(ancestry: nil).each do |parent|
    end
  end

  def create
    @item = Item.new(create_params)
    if @item.save
        redirect_to root_path,notice: "投稿完了しました"
    else
      @category_parent_array = Category.where(ancestry: nil).each do |parent|
      end
      render :new, notice: "fail"
    end        
  end
  
  # 商品購入機能用のアクション（仮）
  def update
  end

  def get_category_children
    @category_children = Category.where('ancestry = ?', "#{params[:parent_name]}")
  end

  def get_category_grandchildren
    @category_grandchildren = Category.where('ancestry LIKE ?', "%/#{params[:child_id]}")
  end

private
  def create_params
    params.require(:item).permit(:name, :text, :category_id, :brand_name, :status, :shipping_charges, :shipping_area, :days_to_ship, :price, photos:[]).merge(saler_id: current_user.id)
  end
end