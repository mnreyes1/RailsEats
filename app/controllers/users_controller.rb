class UsersController < ApplicationController
  load_and_authorize_resource
  before_action :set_user, only: [:show, :add_fav, :delete_fav]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  def add_fav
    restaurante = params[:nombre]
    current_user.rest_fav.push(restaurante)
    current_user.save
    redirect_back(fallback_location: root_path)
  end

  def delete_fav
    restaurante = params[:nombre]
    current_user.rest_fav.delete(restaurante)
    current_user.save
    redirect_back(fallback_location: root_path)
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:user).permit(:nombre, :correo, :direccion, :imagen)
  end
end
