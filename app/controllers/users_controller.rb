class UsersController < ApplicationController
  before_action :authenticate_user!, only: :show
  
  def show
    @categories = Category.all
    @user = User.find(current_user.id)
    @ruikei_shuppin_items = Item.where(saler_id: current_user.id)
    @shuppin_chu_items = Item.where(saler_id: current_user.id, buyer_id: nil).order(created_at: :desc).page(params[:shuppin_chu_page]).per(3)
    @katta_items = Item.where(buyer_id: current_user.id).order(created_at: :desc).page(params[:katta_page]).per(3)
  end
end
