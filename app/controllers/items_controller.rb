class ItemsController < ApplicationController
  def index
  end

  # 商品出品用のアクション
  def new
    @items = Item.new
    @category_parent_array = ["---"]
    Category.where(ancestry: nil).each do |parent|
      @category_parent_array << parent.name
    end
  end

  def create
    @item = Item.new(create_params)
      if @item.save!
        binding.pry
        redirect_to controller: :items, action: :index ,notice: "投稿完了しました"
      else
        render :new
      end        
  end
  
  # 商品購入機能用のアクション（仮）
  def update
  end

  def get_category_children
    @category_children = Category.find_by(name: "#{params[:parent_name]}", ancestry: nil).children
  end

  def get_category_grandchildren
    @category_grandchildren = Category.find("#{params[:child_id]}").children
  end

private
  def create_params
    params.require(:item).permit(:name, :text, :status, :shipping_charges, :shipping_area, :days_to_ship, :price, :category_id, photos:[]).merge(saler_id: current_user.id)
  end
end