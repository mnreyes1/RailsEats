class OrdersController < ApplicationController
  load_and_authorize_resource
  before_action :set_order, only: [:show, :edit, :update, :destroy, :finalizar_pedido, :enviar_pedido]

  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.all
  end

  def enviar_pedido
    order = Order.find(params[:id])
    order.estado = "pedido enviado"
    order.save
    redirect_back fallback_location: home_index_path
  end

  def finalizar_pedido
    order = Order.find(params[:id])
    order.estado = "pedido finalizado"
    order.save
    redirect_back fallback_location: home_index_path
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
  end

  # GET /orders/new
  def new
    @order = Order.new
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(order_params)

    respond_to do |format|
      if @order.save
        format.html { redirect_to pago_path, notice: 'Order was successfully created.' }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        if current_restaurante
          format.html { redirect_to mis_pedidos_path, notice: 'Order was successfully updated.' }
        elsif current_user
          format.html { redirect_to pedidos_usuario_path, notice: 'Order was successfully updated.' }
        end
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_back fallback_location: root_path, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_order
    @order = Order.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def order_params
    params.require(:order).permit(:plato_id, :precio, :medio_pago, :direccion, :hora_entrega, :estado, :info, :user_id, :restaurante_id)
  end
end
