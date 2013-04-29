require 'test_helper'

class CspcrGelImageAnnotationsControllerTest < ActionController::TestCase
  setup do
    @cspcr_gel_image_annotation = cspcr_gel_image_annotations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cspcr_gel_image_annotations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cspcr_gel_image_annotation" do
    assert_difference('CspcrGelImageAnnotation.count') do
      post :create, cspcr_gel_image_annotation: { cspcr_gel_image_id: @cspcr_gel_image_annotation.cspcr_gel_image_id, label: @cspcr_gel_image_annotation.label, position: @cspcr_gel_image_annotation.position }
    end

    assert_redirected_to cspcr_gel_image_annotation_path(assigns(:cspcr_gel_image_annotation))
  end

  test "should show cspcr_gel_image_annotation" do
    get :show, id: @cspcr_gel_image_annotation
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @cspcr_gel_image_annotation
    assert_response :success
  end

  test "should update cspcr_gel_image_annotation" do
    put :update, id: @cspcr_gel_image_annotation, cspcr_gel_image_annotation: { cspcr_gel_image_id: @cspcr_gel_image_annotation.cspcr_gel_image_id, label: @cspcr_gel_image_annotation.label, position: @cspcr_gel_image_annotation.position }
    assert_redirected_to cspcr_gel_image_annotation_path(assigns(:cspcr_gel_image_annotation))
  end

  test "should destroy cspcr_gel_image_annotation" do
    assert_difference('CspcrGelImageAnnotation.count', -1) do
      delete :destroy, id: @cspcr_gel_image_annotation
    end

    assert_redirected_to cspcr_gel_image_annotations_path
  end
end
