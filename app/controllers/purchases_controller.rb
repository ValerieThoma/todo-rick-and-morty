class PurchasesController < ApplicationController
 before_action :find_purchase, only: [:show, :edit, :update, :destroy ]

  def index
    if user_signed_in?
      @purchases = Purchase.where(:user_id => current_user.id).order("created_at DESC")
    end    
  end

  def show 
  end


  def new 
    @purchase = current_user.purchases.build
    @purchase = Purchase.new
  end

  def create
    @purchase =  current_user.purchases.build(purchase_params)
    if @purchase.save
      redirect_to purchases_path
    else
      render 'new'
    end
  end

   def update
    if @purchase.update(purchase_params)
      redirect_to purchase_path(@purchase)
    else
      render 'edit'
    end
  end

  def destroy
    @purchase.destroy
    redirect_to purchases_path
  end

  def complete 
    @purchase = Purchase.find(params[:id])
    @purchase.update_attribute(:completed_at, Time.now)
    redirect_to purchases_path
  end



  def purchase_params
    params.require(:purchase).permit(:title, :description)
  end

  def find_purchase
    @purchase = Purchase.find(params[:id])
  end
end
