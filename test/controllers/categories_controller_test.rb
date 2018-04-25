require 'test_helper'

class CategoriesControllerTest < ActionDispatch::IntegrationTest
  
  def setup
    @category = Category.create(name: "sports")
    @user = User.create(username: "john", email: "john@example.com", password: "password", admin: true)
  end
  
  # Test Routes
  test "should get categories index" do
    get categories_path
    assert_response :success
  end
  
  # We're restricting creating categories to admins, 
  # so we call the sign_in_as method (from test_helper.rb) to be able to test this
  test "should get new" do
    sign_in_as(@user, "password")
    get new_category_path
    assert_response :success
  end
  
  test "should get show" do
    # Thow route for show required an ID so we need to create a test
    # category to check the route
    get category_path(@category)
    assert_response :success
  end
  
  test "should redirect create when admin not logged in" do
    assert_no_difference 'Category.count' do
      post categories_path, params: {category: {name: "sports"}}
    end
    assert_redirected_to categories_path
  end
  
end