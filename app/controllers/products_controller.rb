class ProductsController < ApplicationController
  before_action :authorize
	before_action :authorize_admin

	def index
    @products = Product.all.order(params[:sort])
	end

	def show
		@product = Product.find(params[:id])
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
    @product = Product.find(params[:id])
	end

  def update
    @product = Product.find(params[:id])

		if @product.update(products_params)
			# Check if any new images have been added
			if params[:images]
				params[:images].each do |image|
					# Create the images
					@product.pictures.create(image: image, imageable_id: @product.id)
				end
			end
			redirect_to products_path
		else
			render "edit"
		end
	end

  def destroy
    product = Product.find(params[:id])
		product.destroy
		redirect_to products_path
	end

	private

	def products_params
		params.require(:product).permit(
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