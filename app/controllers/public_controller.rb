class PublicController < ApplicationController
  include PostsHelper
  include UsersHelper
  # before_action :set_user, only: %i[index]
  before_action :authenticate_user!, only: %i[index]

  def index; end

  def private; end
end
