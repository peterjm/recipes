require 'test_helper'

class SourcesControllerTest < ActionController::TestCase

  setup do
    log_in
  end

  test "#show is successful" do
    s = create(:website_source, name: "Awesome Food", url: "http://awesomefood.com")
    get :show, id: s.id
    assert_response :success
    assert_equal "Awesome Food", assigns(:source).name
  end
end
