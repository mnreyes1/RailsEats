class PlatosController < ApplicationController
  load_and_authorize_resource
  before_action :set_plato, only: [:show, :edit, :update, :destroy, :pedir_plato]

  # GET /platos
  # GET /platos.json
  def index
    @platos = Plato.all

    @platos.each do |plato|
      ratings = Comentario.where(plato_id: plato.id).pluck(:puntaje)
      if ratings.size == 0
        ratings = [0]
      end

      avg = (ratings.reduce(:+) / ratings.size.to_f).round(2)
      plato.update_attribute(:valoracion, avg)
    end
  end

  def pedir_plato
    ######################################## REVISAR EL OFFSET ########################################
    plato = Plato.find(params[:id])
    cantidad = params[:cantidad][:cantidad].to_i
    attributes = {}
    plato.attributes.keys.each do |key|
      if key != "id"
        attributes[key] = plato.attributes[key]
      end
    end
    (1..cantidad).each do |n|
      new_plato = Plato.create(attributes)
      new_plato.id = -1 * new_plato.id
      new_plato.save
      order = Order.find_by(:restaurante_id => plato.restaurante_id, :user_id => current_user.id, :estado => "haciendo pedido")
      order.plato.push(new_plato)
      order.save
    end
    redirect_back fallback_location: root_path
  end

  # GET /platos/1
  # GET /platos/1.json
  def show
    ratings = Comentario.where(plato_id: params[:id]).pluck(:puntaje)
    if ratings.size == 0
      ratings = [0]
    end

    avg = (ratings.reduce(:+) / ratings.size.to_f).round(2)
    @plato.update_attribute(:valoracion, avg)
  end

  # GET /platos/new
  def new
    @plato = Plato.new
  end

  # GET /platos/1/edit
  def edit
    ratings = Comentario.where(plato_id: params[:id]).pluck(:puntaje)
    if ratings.size == 0
      ratings = [0]
    end

    avg = (ratings.reduce(:+) / ratings.size.to_f).round(2)
    @plato.update_attribute(:valoracion, avg)
  end

  # POST /platos
  # POST /platos.json
  def create
    @plato = Plato.new(plato_params)

    respond_to do |format|
      if @plato.save
        format.html { redirect_to @plato, notice: 'Plato was successfully created.' }
        format.json { render :show, status: :created, location: @plato }
      else
        format.html { render :new }
        format.json { render json: @plato.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /platos/1
  # PATCH/PUT /platos/1.json
  def update
    respond_to do |format|
      if @plato.update(plato_params)
        format.html { redirect_to @plato, notice: 'Plato was successfully updated.' }
        format.json { render :show, status: :ok, location: @plato }

        ratings = Comentario.where(plato_id: params[:id]).pluck(:puntaje)
        if ratings.size == 0
          ratings = [0]
        end

        avg = (ratings.reduce(:+) / ratings.size.to_f).round(2)
        @plato.update_attribute(:valoracion, avg)
      else
        format.html { render :edit }
        format.json { render json: @plato.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /platos/1
  # DELETE /platos/1.json
  def destroy
    @plato.destroy
    respond_to do |format|
      if current_restaurante
        format.html { redirect_to mis_platos_path, notice: 'Plato was successfully destroyed.' }
        format.json { head :no_content }
      else
        format.html { redirect_to platos_url, notice: 'Plato was successfully destroyed.' }
        format.json { head :no_content }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_plato
    @plato = Plato.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def plato_params
    params.require(:plato).permit(:nombre, :precio, :descripcion, :n_personas, :imagenes, :photo, :valoracion, :restaurante_id)
  end
end
