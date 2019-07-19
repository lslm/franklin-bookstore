# frozen_string_literal: true

class ProductsController < ApplicationController
  before_action :authorize
  before_action :authorize_admin

  def index
    @products = Product.all.order(:id)
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
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render json: @product, status: :created, location: @product }
      else
        format.html { render action: 'new' }
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
      redirect_to products_path
    else
      render 'edit'
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
      images: []
    )
  end
end
