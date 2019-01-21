require 'test_helper'

class TagsControllerTest < ActionController::TestCase
  setup do
    @picture = pictures(:one)
    @tag = tags(:one)
  end

  test "should get index" do
    get :index, params: { picture_id: @picture }
    assert_response :success
  end

  test "should get new" do
    get :new, params: { picture_id: @picture }
    assert_response :success
  end

  test "should create tag" do
    assert_difference('Tag.count') do
      post :create, params: { picture_id: @picture, tag: @tag.attributes }
    end

    assert_redirected_to picture_tag_path(@picture, Tag.last)
  end

  test "should show tag" do
    get :show, params: { picture_id: @picture, id: @tag }
    assert_response :success
  end

  test "should get edit" do
    get :edit, params: { picture_id: @picture, id: @tag }
    assert_response :success
  end

  test "should update tag" do
    put :update, params: { picture_id: @picture, id: @tag, tag: @tag.attributes }
    assert_redirected_to picture_tag_path(@picture, Tag.last)
  end

  test "should destroy tag" do
    assert_difference('Tag.count', -1) do
      delete :destroy, params: { picture_id: @picture, id: @tag }
    end

    assert_redirected_to picture_tags_path(@picture)
  end
end
