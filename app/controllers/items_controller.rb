class ItemsController < ApplicationController
  def index
    @categories = Category.all
  end

  def update
  end

end
