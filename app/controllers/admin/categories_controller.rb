class Admin::CategoriesController < ApplicationController
	before_action :authorize_admin

	def index
		@categories = Admin::Category.all.order('created_at ASC')
	end

	def new
		@category = current_user.categories.build
	end

	def create
		@category = current_user.categories.build(categories_params)

		if @category.save
			redirect_to admin_categories_path
		else
			render 'new'
		end
	end

	def edit
		@category = Admin::Category.find(params[:id])
	end

	def update
		@category = Admin::Category.find(params[:id])

		if @category.update(categories_params)
			redirect_to admin_categories_path
		else
			render 'edit'
		end
	end

	def destroy
		@category = Admin::Category.find(params[:id])
		@category.destroy
		redirect_to admin_categories_path
	end

	private

	def categories_params
		params.require(:admin_category).permit(:name, :image, :user_id)
	end
end
