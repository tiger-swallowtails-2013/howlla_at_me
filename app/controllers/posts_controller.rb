class PostsController < ActionController::Base
  def create
    Post.create(params[:post])
  end

  def new
    @post = Post.new
  end
end