class UsersController < ApplicationController
  def index 
    if params[:username]
      render json: User.user_search_username(params[:username])
    else
    render json: User.all
    end
  end

  def create
    user = User.new(user_params)
    if user.save
     render json: user
    else
      render json: user.errors.full_messages, status: 422
    end
  end

  def show
    user = User.exists?(params[:id])
    if user 
      render json: User.find(params[:id])
    else
      render plain: 'no user with that id'
    end

  end

  def update
    user = User.find_by(id: params[:id])
    if user.update(user_params)
      render json: user
    else
      render json: user.errors.full_messages, status: 422
    end

  end

  def destroy 
    user = User.find_by(id: params[:id])
    if user && user.destroy
      render plain: "User has been DESTROYED!"
    else 
      render plain: 'no user with that id'
    end
  end

  private
  def user_params 
    params.require(:user).permit(:username)
  end

end