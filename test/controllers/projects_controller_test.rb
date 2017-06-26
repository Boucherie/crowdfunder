require_relative '../test_helper'

class ProjectsControllerTest < ActionDispatch::IntegrationTest

  test "should show homepage" do
    get root_path
    assert_response :success
    assert_select 'h1', "Crowdfunder"
  end


  test "user can access login form" do
    get login_path
    assert_response :success

  end

  test "user can log in" do
    user_login
    assert_response :redirect
  end

  def user_login
    user = build(:user, email: "bettymaker@gmail.com", password: "123456789", password_confirmation: "123456789")
    user.save!
    @user = user
    post user_sessions_path, params: {email: user.email, password: "123456789"}
  end


  test "should get form" do
    user_login
    get new_project_path
    assert_select 'h1', "Create a new project"
  end

  test "create new project" do
   user_login
    project1 = {
      title:       'Cool new boardgame',
      description: 'Trade sheep',
      start_date:  Date.today,
      end_date:    Date.today + 1.month,
      goal:        50000
     }
     post "/projects", params: {project:  project1}
   end
end



#
#
#
# require 'test_helper'
#
# class ArticlesControllerTest < ActionDispatch::IntegrationTest
#   # called before every single test
#   setup do
#     @article = articles(:one)
#   end
#
#   # called after every single test
#   teardown do
#     # when controller is using cache it may be a good idea to reset it afterwards
#     Rails.cache.clear
#   end
#
#   test "should show article" do
#     # Reuse the @article instance variable from setup
#     get article_url(@article)
#     assert_response :success
#   end
#
#   test "should destroy article" do
#     assert_difference('Article.count', -1) do
#       delete article_url(@article)
#     end
#
#     assert_redirected_to articles_path
#   end
#
#   test "should update article" do
#     patch article_url(@article), params: { article: { title: "updated" } }
#
#     assert_redirected_to article_path(@article)
#     # Reload association to fetch updated data and assert that title is updated.
#     @article.reload
#     assert_equal "updated", @article.title
#   end
# end
