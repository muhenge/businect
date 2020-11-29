class UsersController < ApplicationController
    include UsersHelper

    before_action :set_user, only: %i[show]
    def index
    end

    def show
    end
end
