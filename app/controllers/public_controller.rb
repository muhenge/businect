class PublicController < ApplicationController
  
  def index
    @posts = Post.all
  end

  def private
  end
end
