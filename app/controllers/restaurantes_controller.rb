class RestaurantesController < ApplicationController
  load_and_authorize_resource
  before_action :set_restaurante, only: [:show, :aprobar_solicitud]

  # GET /restaurantes
  # GET /restaurantes.json
  def index
    @restaurantes = Restaurante.all

    @restaurantes.each do |restaurante|
      ratings = Comentario.where(restaurante_id: restaurante.id).pluck(:puntaje)
      if ratings.size == 0
        ratings = [0]
      end

      avg = (ratings.reduce(:+) / ratings.size.to_f).round(2)
      restaurante.update_attribute(:valoracion, avg)
    end

    # https://stackoverflow.com/questions/48219109/get-average-of-attribute-through-has-many
  end

  def aprobar_solicitud
    @restaurante = Restaurante.find(params[:id])
    @restaurante.update_attribute(:status, "aprobado")
    redirect_back fallback_location: solicitudes_path
  end

  def edit
    @restaurante = Restaurante.find(params[:id])
    # @restaurante.update_attribute(:valoracion, 3)
  end

  # GET /restaurantes/1
  # GET /restaurantes/1.json
  def show
    @restaurante = Restaurante.find(params[:id])
    ratings = Comentario.where(restaurante_id: params[:id]).pluck(:puntaje)
    if ratings.size == 0
      ratings = [0]
    end

    avg = (ratings.reduce(:+) / ratings.size.to_f).round(2)
    @restaurante.update_attribute(:valoracion, avg)
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_restaurante
    ratings = Comentario.where(restaurante_id: params[:id]).pluck(:puntaje)
    if ratings.size == 0
      ratings = [0]
    end

    avg = (ratings.reduce(:+) / ratings.size.to_f).round(2)
    @restaurante.update_attribute(:valoracion, avg)
    @restaurante = Restaurante.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def restaurante_params
    ratings = Comentario.where(restaurante_id: params[:id]).pluck(:puntaje)
    if ratings.size == 0
      ratings = [0]
    end

    avg = (ratings.reduce(:+) / ratings.size.to_f).round(2)
    @restaurante.update_attribute(:valoracion, avg)
    params.require(:restaurante).permit(:nombre, :email, :direccion, :valoracion, :photo, :imagen, :telefono)
  end
end
