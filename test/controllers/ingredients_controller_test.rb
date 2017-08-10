require 'test_helper'

class IngredientsControllerTest < ActionController::TestCase

  setup do
    log_in
  end

  test "#show is successful" do
    ing = create(:ingredient, name: "foo")
    get :show, params: { id: ing.id }
    assert_response :success
    assert_equal "foo", assigns(:ingredient).name
  end
end
