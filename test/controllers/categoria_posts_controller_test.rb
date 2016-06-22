require 'test_helper'

class CategoriaPostsControllerTest < ActionController::TestCase
  setup do
    @categoria_post = categoria_posts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:categoria_posts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create categoria_post" do
    assert_difference('CategoriaPost.count') do
      post :create, categoria_post: { categoria_id: @categoria_post.categoria_id, post_id: @categoria_post.post_id }
    end

    assert_redirected_to categoria_post_path(assigns(:categoria_post))
  end

  test "should show categoria_post" do
    get :show, id: @categoria_post
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @categoria_post
    assert_response :success
  end

  test "should update categoria_post" do
    patch :update, id: @categoria_post, categoria_post: { categoria_id: @categoria_post.categoria_id, post_id: @categoria_post.post_id }
    assert_redirected_to categoria_post_path(assigns(:categoria_post))
  end

  test "should destroy categoria_post" do
    assert_difference('CategoriaPost.count', -1) do
      delete :destroy, id: @categoria_post
    end

    assert_redirected_to categoria_posts_path
  end
end
