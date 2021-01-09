class InterestsController < ApplicationController
    include InterestsHelper
    before_action :set_interest, only: [:show]
    before_action :authenticate_user!

    def index
        @interests = Interest.all
    end

    def show
        @interest_post = @interest.posts
    end
end
