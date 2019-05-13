class CheckoutsController < ApplicationController
  before_action :find_checkout, only: [:show]
  before_action :find_order, only: [:new, :create]
  skip_before_action :verify_authenticity_token

  def index
    @checkouts = current_user.checkouts
  end

  def show
    @checkout = Checkout.find_by_slug(params[:slug])
    @order = Order.find_by_id(@checkout.order_id)
    @order_items = Order.find_by_id(@order.id).order_items
    @order_items.each do |order_item|
      @products = Product.where(id: order_item.stock.product_id)
    end
  end

  def new
    @checkout = Checkout.new
    @order = Order.find(params[:order_id])
    @coupom = Coupom.find_by_code(params[:coupom_code])
  end

  def create
    @checkout = Checkout.new(checkouts_params)
    @checkout.status = 'waiting_confirmation'
    @coupom = Coupom.find_by_code(params[:coupom_code])

    if @order.present?
      @order.coupom_code = @coupom.code if @coupom

      @checkout.set_gst(@order.subtotal, @order.gst)
      @checkout.order_id = @order.id

      @order.save!

      if current_user
        @checkout.user_id = current_user.id
      end

      respond_to do |format|
        if @checkout.save
          update_stock

          session.delete(:order_id)
          session[:checkout_id] = @checkout.id
  
          # Creates a new order for the customer when they checkout
          # Saves old order record, which is referred to by the checkout record
          if current_user
            order = Order.new(user_id: current_user.id)
          else
            order = Order.new
          end
          order.save
          format.html { redirect_to checkouts_path, notice: 'Entrada de estoque criada com sucesso' }
        else
          format.html { render :new }
        end
      end
    end
  end

  def update
    coupom = Coupom.find_by_code(checkouts_params[:coupom_code])
  end

  private

  def update_stock
    @order.order_items.each do |order_item|
      binding.pry
      item_stock = order_item.stock

      item_stock.update(quantity: item_stock.quantity - order_item.quantity)
    end
  end

  def checkouts_params
    params.require(:checkout).permit(
      :total, :first_name, :last_name, :email, :shipping_address, :shipping_suburb, :shipping_zip, :shipping_state,
      :billing_address, :billing_suburb, :billing_zip, :billing_state, :phone, :order_id, :user_id,
      :credit_card_number, :credit_card_name, :credit_card_expire_date, :credit_card_ccv,
      :coupom_code
    )
  end

  def find_order
    @order = Order.find_by_id(params[:order_id])
  end

  def find_checkout
    @checkout = Checkout.find_by_slug(params[:slug])
  end
end
