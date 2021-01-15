class InterestsController < ApplicationController
    include InterestsHelper
    before_action :set_interest, only: [:show]
    before_action :authenticate_user!

    def index
        @interests = Interest.all
    end

    def post_by_interest
        @posts = current_user.interest.posts
    end

    def show
        @interest_post = @interest.posts
    end
end
