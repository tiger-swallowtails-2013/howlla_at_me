class IndexController < ActionController::Base
  def show
    @posts = Post.all
  end
end
