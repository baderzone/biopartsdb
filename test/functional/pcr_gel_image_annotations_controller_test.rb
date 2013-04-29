require 'test_helper'

class PcrGelImageAnnotationsControllerTest < ActionController::TestCase
  setup do
    @pcr_gel_image_annotation = pcr_gel_image_annotations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pcr_gel_image_annotations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pcr_gel_image_annotation" do
    assert_difference('PcrGelImageAnnotation.count') do
      post :create, pcr_gel_image_annotation: { label: @pcr_gel_image_annotation.label, pcr_gel_image_id: @pcr_gel_image_annotation.pcr_gel_image_id, position: @pcr_gel_image_annotation.position }
    end

    assert_redirected_to pcr_gel_image_annotation_path(assigns(:pcr_gel_image_annotation))
  end

  test "should show pcr_gel_image_annotation" do
    get :show, id: @pcr_gel_image_annotation
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @pcr_gel_image_annotation
    assert_response :success
  end

  test "should update pcr_gel_image_annotation" do
    put :update, id: @pcr_gel_image_annotation, pcr_gel_image_annotation: { label: @pcr_gel_image_annotation.label, pcr_gel_image_id: @pcr_gel_image_annotation.pcr_gel_image_id, position: @pcr_gel_image_annotation.position }
    assert_redirected_to pcr_gel_image_annotation_path(assigns(:pcr_gel_image_annotation))
  end

  test "should destroy pcr_gel_image_annotation" do
    assert_difference('PcrGelImageAnnotation.count', -1) do
      delete :destroy, id: @pcr_gel_image_annotation
    end

    assert_redirected_to pcr_gel_image_annotations_path
  end
end
