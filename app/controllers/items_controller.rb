class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index]


  def index
  end


  def new
    @item = Item.new
  end

  def create
    Item.create(item_params)
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:name, :explanation, :category_id, :shopping_charge_id, :prefecture_id, :deadline_id, :status_id, :price, :image).merge(user_id: current_user.id)
  end

end
