require 'test_helper'

class RecipesControllerTest < ActionController::TestCase

  setup do
    log_in
  end

  test "#index is successful" do
    get :index
    assert_response :success
  end

  test "#show is successful" do
    r = create(:recipe)
    get :show, id: r.id
    assert_response :success
  end

  test "#new is successful" do
    get :new
    assert_response :success
  end

  test "#create creates a new recipe" do
    assert_difference "Recipe.count", 1 do
      post :create, recipe: attributes_for(:recipe)
    end
    assert_redirected_to recipe_path(Recipe.last)
  end

  test "#create fails if the params are missing" do
    assert_no_difference "Recipe.count" do
      post :create, recipe: {title: ""}
    end
    assert_response 200
    assert_template 'new'
  end

  test "#edit is successful" do
    r = create(:recipe)
    get :edit, id: r.id
    assert_response :success
  end

  test "#update is successful" do
    r = create(:recipe, title: "Bagels")
    patch :update, id: r.id, recipe: {title: "Dinner rolls"}
    assert_redirected_to recipe_path(r)
    assert_equal "Dinner rolls", r.reload.title
  end

  test "#update fails if the parameters are invalid" do
    r = create(:recipe, title: "Bagels")
    patch :update, id: r.id, recipe: {title: nil}
    assert_response :success
    assert_template 'edit'
    assert_equal "Bagels", r.reload.title
  end
end
