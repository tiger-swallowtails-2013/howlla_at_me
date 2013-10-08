class IndexController < ActionController::Base
  def show
    @posts = Post.order('created_at DESC')
  end
end
