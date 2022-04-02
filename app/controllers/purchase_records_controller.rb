class PurchaseRecordsController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @purchase_record_address = PurchaseRecordAddress.new
  end

  def create
    @item = Item.find(params[:item_id])
    @purchase_record_address = PurchaseRecordAddress.new(purchase_record_params)
    if @purchase_record_address.valid?
      @purchase_record_address.save
      redirect_to root_path

    else
      render :index
    end

  end

  private

  def purchase_record_params
    params.require(:purchase_record_address).permit(:post_code, :prefecture_id, :municipality, :house_number, :building, :phone_number).merge(user_id: current_user.id, item_id: @item.id)
  end
end
