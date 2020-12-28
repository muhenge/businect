module InterestsHelper
    def interest_params
        params.require(:interest).permit(:field_of_interest)
    end

    private

    def set_interest
        @interest = Interest.find(params[:id])
    end
end
