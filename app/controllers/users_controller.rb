class UsersController < ApplicationController

  def index
    @users = User.all

    render json: @users
  end

  def show
    @user = User.find(params[:id])

    render json: @user
  end

  def create
    @user = User.new(params_user)

    if @user.save
      render json: @user, status: 200
    else
      render json: @user.errors, status: 500
    end
  end

  def update
    @user = User.find(params[:id])

    if @user.update(params_user)
      render json: @user, status: 201
    else
      render json: @user.errors, status: 500
    end
  end

  def destroy
    @user = User.find(params[:id])

    @user.destroy
    head :no_content
  end

  private

  def params_user
    params.permit(:name, :email)
  end

end
