class UsersController < ApplicationController

  def index
    render json: User.all
  end

  def show
    @user = User.find( params[:id] )
    render json: @user.fancy_json
  end

  def titanic
    render json: User.titanic_lovers
  end

end