require 'test_helper'

class PrereqsControllerTest < ActionController::TestCase
  setup do
    @prereq = prereqs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:prereqs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create prereq" do
    assert_difference('Prereq.count') do
      post :create, prereq: { instruction: @prereq.instruction, scenario_id: @prereq.scenario_id }
    end

    assert_redirected_to prereq_path(assigns(:prereq))
  end

  test "should show prereq" do
    get :show, id: @prereq
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @prereq
    assert_response :success
  end

  test "should update prereq" do
    patch :update, id: @prereq, prereq: { instruction: @prereq.instruction, scenario_id: @prereq.scenario_id }
    assert_redirected_to prereq_path(assigns(:prereq))
  end

  test "should destroy prereq" do
    assert_difference('Prereq.count', -1) do
      delete :destroy, id: @prereq
    end

    assert_redirected_to prereqs_path
  end
end
