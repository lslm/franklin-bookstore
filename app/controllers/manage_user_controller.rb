# frozen_string_literal: true

class ManageUserController < ApplicationController
  def index
    @users = User.all.order(:created_at)
  end

  def show
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])

    user.admin = params[:admin]
    user.save!

    redirect_to manage_user_path(user), notice: 'Nível alterado com sucesso!'
  end
end
