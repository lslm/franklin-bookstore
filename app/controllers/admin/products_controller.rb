class Admin::ProductsController < ApplicationController
  before_action :authorize
	before_action :authorize_admin

	def index
    @products = Admin::Product.all.order(params[:sort])
	end

	def show
		@product = Admin::Product.find(params[:id])
	end

	def new
		@product = current_user.products.build
	end

	def create
		@product = current_user.products.build(products_params)
		
		respond_to do |format|
			if @product.save

				if params[:images]
					params[:images].each { |image|
						@product.pictures.create(image: image, imageable_id: @product.id)
					}
				end

				format.html { redirect_to @product, notice: 'Product was successfully created.' }
				format.json { render json: @product, status: :created, location: @product }
			else
				format.html { render action: "new" }
				format.json { render json: @product.errors, status: :unprocessable_entity }
			end
		end
	end

  def edit
    @product = Admin::Product.find(params[:id])
	end

  def update
    @product = Admin::Product.find(params[:id])

		if @product.update(products_params)
			# Check if any new images have been added
			if params[:images]
				params[:images].each do |image|
					# Create the images
					@product.pictures.create(image: image, imageable_id: @product.id)
				end
			end
			redirect_to admin_products_path
		else
			render "edit"
		end
	end

  def destroy
    product = Admin::Product.find(params[:id])
		product.destroy
		redirect_to admin_products_path
	end

	private

	def products_params
		params.require(:admin_product).permit(
			:name,
			:description,
			:price,
			:old_price,
			:on_sale,
			:quantity,
			:sold_out,
			:featured,
			:category_id,
			:pictures,
			:author,
    	:year,
    	:title,
    	:publisher,
    	:edition,
    	:isbn,
    	:pages,
    	:dimensions,
    	:barcode,
    	:active,
    	:activation_reason,
			pictures_attributes: [:id, :image, :_destroy])
	end
end