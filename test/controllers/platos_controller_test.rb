require 'test_helper'

class PlatosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @plato = platos(:one)
  end

  test "should get index" do
    get platos_url
    assert_response :success
  end

  test "should get new" do
    get new_plato_url
    assert_response :success
  end

  test "should create plato" do
    assert_difference('Plato.count') do
      post platos_url, params: { plato: { descripcion: @plato.descripcion, imagenes: @plato.imagenes, n_personas: @plato.n_personas, nombre: @plato.nombre, precio: @plato.precio, restaurante_id: @plato.restaurante_id, valoracion: @plato.valoracion } }
    end

    assert_redirected_to plato_url(Plato.last)
  end

  test "should show plato" do
    get plato_url(@plato)
    assert_response :success
  end

  test "should get edit" do
    get edit_plato_url(@plato)
    assert_response :success
  end

  test "should update plato" do
    patch plato_url(@plato), params: { plato: { descripcion: @plato.descripcion, imagenes: @plato.imagenes, n_personas: @plato.n_personas, nombre: @plato.nombre, precio: @plato.precio, restaurante_id: @plato.restaurante_id, valoracion: @plato.valoracion } }
    assert_redirected_to plato_url(@plato)
  end

  test "should destroy plato" do
    assert_difference('Plato.count', -1) do
      delete plato_url(@plato)
    end

    assert_redirected_to platos_url
  end
end
