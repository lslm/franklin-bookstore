class ProductsController < ApplicationController
	def index
		if params[:category].blank?
	  	@product = Product.all.order(params[:sort])
    else
    	@category_id = Category.find_by(name: params[:category]).id
    	if params[:sort]
    		@product = Product.where(category_id: @category_id).order(params[:sort])
    	else
    		@product = Product.where(category_id: @category_id).order("created_at ASC")
    	end
    	@category = Category.find(@category_id)
    end
	end

	def show
		@product = Product.find(params[:id])
		@order_item = current_order.order_items.new
	end

	private

	def products_params
		params.require(:product).permit(:name, :description, :price, :old_price, :on_sale, :quantity, :sold_out, :featured, :category_id, :pictures, pictures_attributes: [:id, :image, :_destroy])
	end
end