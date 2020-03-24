class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :set_category_parent_array, only: [:new, :create, :edit, :update]

  # 商品一覧表示(トップページ)用のアクション
  def index
    @categories = Category.all
    @items = Item.where(buyer_id: nil).order("created_at DESC").limit(6)
  end

  # 商品出品用のアクション
  def new
    if user_signed_in?
      @item = Item.new
    else
      redirect_to new_user_session_path
    end
  end

  # 商品出品時のデータ保存用アクション
  def create
    @item = Item.new(create_params)
    if @item.save
      redirect_to controller: :users, action: :show, id: current_user.id
    else
      render :new, notice: "fail"
    end        
  end

  # 商品出品時のカテゴリー取得に使用
  def get_category_children
    @category_children = Category.where('ancestry = ?', "#{params[:parent_name]}")
  end

  def get_category_grandchildren
    @category_grandchildren = Category.where('ancestry LIKE ?', "%/#{params[:child_id]}")
  end
  
  # 商品詳細表示用のアクション
  def show
    @categories = Category.all
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
  
  # 商品情報編集用のアクション
  def edit
    @grandchild = @item.category
    @child = @grandchild.parent
    @parent = @grandchild.parent.parent
    @category = @item.category
    @category_children_array = Category.where('ancestry = ?', "#{@category.parent.ancestry}")
    @category_grandchildren_array = Category.where('ancestry = ?', "#{@category.ancestry}")
  end

  # 商品情報編集時のデータ保存用アクション
  def update
    if @item.update(create_params)
      redirect_to item_path(@item), notice: "商品名「#{@item.name}」の情報を更新しました。"
    else
      render :edit, notice: "fail"
    end
  end

  # 商品削除用のアクション
  def destroy
    @item.destroy
    redirect_to user_path(current_user), notice: "商品名「#{@item.name}」を削除しました。"
  end

private

  # 商品出品時のparams
  def create_params
    params.require(:item).permit(:name, :text, :category_id, :brand_name, :status, :shipping_charges, :shipping_area, :days_to_ship, :price, photos:[]).merge(saler_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def set_category_parent_array
    @category_parent_array = Category.where(ancestry: nil)
  end
end



