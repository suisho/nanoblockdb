require 'test_helper'

class PackageContentsControllerTest < ActionController::TestCase
  setup do
    @package_content = package_contents(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:package_contents)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create package_content" do
    assert_difference('PackageContent.count') do
      post :create, package_content: { color_id: @package_content.color_id, count: @package_content.count, package_id: @package_content.package_id, shape_id: @package_content.shape_id }
    end

    assert_redirected_to package_content_path(assigns(:package_content))
  end

  test "should show package_content" do
    get :show, id: @package_content
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @package_content
    assert_response :success
  end

  test "should update package_content" do
    patch :update, id: @package_content, package_content: { color_id: @package_content.color_id, count: @package_content.count, package_id: @package_content.package_id, shape_id: @package_content.shape_id }
    assert_redirected_to package_content_path(assigns(:package_content))
  end

  test "should destroy package_content" do
    assert_difference('PackageContent.count', -1) do
      delete :destroy, id: @package_content
    end

    assert_redirected_to package_contents_path
  end
end
