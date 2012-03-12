require 'test_helper'

class Admin::ColorsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => Color.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    Color.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Color.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to admin_color_url(assigns(:color))
  end

  def test_edit
    get :edit, :id => Color.first
    assert_template 'edit'
  end

  def test_update_invalid
    Color.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Color.first
    assert_template 'edit'
  end

  def test_update_valid
    Color.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Color.first
    assert_redirected_to admin_color_url(assigns(:color))
  end

  def test_destroy
    color = Color.first
    delete :destroy, :id => color
    assert_redirected_to admin_colors_url
    assert !Color.exists?(color.id)
  end
end
