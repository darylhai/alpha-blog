require 'test_helper'

class CategoriesControllerTest < ActionDispatch::IntegrationTest
  
  def setup
    @category = Category.create(name: "sports")
  end
  
  # Test Routes
  test "should get categories index" do
    get categories_path
    assert_response :success
  end

  test "should get new" do
    get new_category_path
    assert_response :success
  end
  
  test "should get show" do
    # Thow route for show required an ID so we need to create a test
    # category to check the route
    get category_path(@category)
    assert_response :success
  end
  
end