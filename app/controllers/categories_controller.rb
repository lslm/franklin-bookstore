class CategoriesController < ApplicationController
  before_action :authorize_admin

  def index
    @categories = IndexCommand.new.execute
  end

  def new
    @category = current_user.categories.build
  end

  def create
    CreateCommand.new.execute(categories_params)

    redirect_to categories_path
  end

  def edit
    @category = ShowCommand.new.execute(params[:id])
  end

  def update
    category = Category.find(params[:id])
    UpdateCommand.new.execute(category.id, categories_params)

    redirect_to categories_path
  end

  def destroy
    DestroyCommand.new.execute(params[:id])
    redirect_to categories_path
  end

  private

  def categories_params
    params.require(:category).permit(:name)
  end
end
