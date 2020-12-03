class PublicController < ApplicationController
  include PostsHelper
  include UsersHelper
  # before_action :set_user, only: %i[index]
  before_action :authenticate_user!, only: %i[index]

  def index
    @posts = Post.all
  end

  def private; end
end
