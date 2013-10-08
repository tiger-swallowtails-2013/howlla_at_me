class IndexController < ApplicationController
  def show
    @posts = Post.order('created_at DESC')
  end
end
