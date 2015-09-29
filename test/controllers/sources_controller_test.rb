require 'test_helper'

class SourcesControllerTest < ActionController::TestCase

  setup do
    log_in
  end

  test "#index is successful" do
    s = create(:website_source, name: "Awesome Food", url: "http://awesomefood.com")
    get :index
    assert_response :success
    assert_equal "Awesome Food", assigns(:sources).first.name
  end

  test "#show is successful" do
    s = create(:website_source, name: "Awesome Food", url: "http://awesomefood.com")
    get :show, id: s.id
    assert_response :success
    assert_equal "Awesome Food", assigns(:source).name
  end

  test "#new is successful" do
    get :new
    assert_response :success
    assert assigns(:source).new_record?
  end

  test "#create is successful" do
    assert_difference "Source.count", 1 do
      post :create, source: {
        name: "Awesome Food",
        source_type: Source::WEBSITE_TYPE,
        url: "http://awesomefood.com"
      }
    end
    s = Source.last
    assert_redirected_to source_path(s)
    assert_equal "Awesome Food", s.name
    assert_equal "http://awesomefood.com", s.url
    assert_equal Source::WEBSITE_TYPE, s.source_type
  end

  test "#edit is successful" do
    s = create(:website_source, name: "Awesome Food", url: "http://awesomefood.com")
    get :edit, id: s.id
    assert_response :success
    assert_equal "Awesome Food", assigns(:source).name
  end

  test "#update is successful" do
    s = create(:website_source, name: "Awesome Food", url: "http://awesomefood.com")
    put :update, id: s.id, source: {name: "Awesomer Food"}
    s.reload
    assert_redirected_to source_path(s)
    assert_equal "Awesomer Food", s.name
  end
end
