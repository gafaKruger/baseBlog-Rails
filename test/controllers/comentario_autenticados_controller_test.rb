require 'test_helper'

class ComentarioAutenticadosControllerTest < ActionController::TestCase
  setup do
    @comentario_autenticado = comentario_autenticados(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:comentario_autenticados)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create comentario_autenticado" do
    assert_difference('ComentarioAutenticado.count') do
      post :create, comentario_autenticado: { comentario_id: @comentario_autenticado.comentario_id, usuario_id: @comentario_autenticado.usuario_id }
    end

    assert_redirected_to comentario_autenticado_path(assigns(:comentario_autenticado))
  end

  test "should show comentario_autenticado" do
    get :show, id: @comentario_autenticado
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @comentario_autenticado
    assert_response :success
  end

  test "should update comentario_autenticado" do
    patch :update, id: @comentario_autenticado, comentario_autenticado: { comentario_id: @comentario_autenticado.comentario_id, usuario_id: @comentario_autenticado.usuario_id }
    assert_redirected_to comentario_autenticado_path(assigns(:comentario_autenticado))
  end

  test "should destroy comentario_autenticado" do
    assert_difference('ComentarioAutenticado.count', -1) do
      delete :destroy, id: @comentario_autenticado
    end

    assert_redirected_to comentario_autenticados_path
  end
end
