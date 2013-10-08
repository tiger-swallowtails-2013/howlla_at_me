class PostsController < ActionController::Base
  def create
    Post.create(title: params[:title], description: params[:description])
  end
end