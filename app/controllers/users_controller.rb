class UsersController < ApplicationController
  before_action :authenticate_user!, only: :show
  
  def show
    @categories = Category.all
    @user = User.find(current_user.id)
  end
end
