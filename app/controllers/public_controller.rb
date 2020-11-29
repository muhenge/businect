class PublicController < ApplicationController
  include PostsHelper
  def index
    @posts = Post.all
  end

  def private
  end
end
