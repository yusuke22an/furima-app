class ItemsController < ApplicationController

  def index
    @categories = Category.all
    @items = Item.where(buyer_id: nil).order("created_at DESC").limit(6)
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

  def show
    @categories = Category.all
    @item = Item.find(params[:id])
    if @item.category.parent == nil
      # 一番上のカテゴリ
      @parent = @item.category.name
    elsif @item.category.parent.parent == nil
      # 真ん中のカテゴリ
      @parent = @item.category.parent.name
      @child = @item.category.name
    else
      # 一番下のカテゴリ
      @parent = @item.category.parent.parent.name
      @child = @item.category.parent.name
      @grand_child = @item.category.name
    end

  end

private
  def create_params
    params.require(:item).permit(:name, :text, :category_id, :brand_name, :status, :shipping_charges, :shipping_area, :days_to_ship, :price, photos:[]).merge(saler_id: current_user.id)
  end
end