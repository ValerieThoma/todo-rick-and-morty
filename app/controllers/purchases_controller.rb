class PurchasesController < ApplicationController
 before_action :find_purchase, only: [:show, :edit, :update, :destroy]

  def index
    # if user_signed_in?
    #   @purchases = Purchase.where(:user_id => current_user.id).order("created_at DESC")
    # end  
    @purchase = Purchase.new
      redirect new_purchase_path
  end

  def show 
  end


  def new 
    # @purchase = current_user.purchases.build
    @purchase = Purchase.new
  end

  def create
    @purchase =  current_user.purchases.build(item_params)
    if @purchase.save
      redirect_to root_path
    else
      render 'new'
    end
  end



  def purchase_params
    params.require(:purchase).permit(:title, :description)
  end

  def find_purchase
    @purchase = Purchase.find(params[:id])
  end
end
