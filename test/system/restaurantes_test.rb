require "application_system_test_case"

class RestaurantesTest < ApplicationSystemTestCase
  setup do
    @restaurante = restaurantes(:one)
  end

  test "visiting the index" do
    visit restaurantes_url
    assert_selector "h1", text: "Restaurantes"
  end

  test "creating a Restaurante" do
    visit restaurantes_url
    click_on "New Restaurante"

    fill_in "Correo", with: @restaurante.correo
    fill_in "Direccion", with: @restaurante.direccion
    fill_in "Imagen", with: @restaurante.imagen
    fill_in "Nombre", with: @restaurante.nombre
    fill_in "Telefono", with: @restaurante.telefono
    fill_in "Valoracion", with: @restaurante.valoracion
    click_on "Create Restaurante"

    assert_text "Restaurante was successfully created"
    click_on "Back"
  end

  test "updating a Restaurante" do
    visit restaurantes_url
    click_on "Edit", match: :first

    fill_in "Correo", with: @restaurante.correo
    fill_in "Direccion", with: @restaurante.direccion
    fill_in "Imagen", with: @restaurante.imagen
    fill_in "Nombre", with: @restaurante.nombre
    fill_in "Telefono", with: @restaurante.telefono
    fill_in "Valoracion", with: @restaurante.valoracion
    click_on "Update Restaurante"

    assert_text "Restaurante was successfully updated"
    click_on "Back"
  end

  test "destroying a Restaurante" do
    visit restaurantes_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Restaurante was successfully destroyed"
  end
end
