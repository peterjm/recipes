require 'test_helper'

class RecipesControllerTest < ActionController::TestCase

  setup do
    log_in
  end

  test "#index is successful" do
    get :index
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

end
