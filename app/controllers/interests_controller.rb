class InterestsController < ApplicationController
  # before_action :authenticate_user!

  def create
     @interest = Interest.new(interest_params)
     @interest.user_id = current_user.id
    if @interest.valid?
       @interest.save

       redirect_to root_path
     else
       redirect_to root_path, alert: "Interest not created"
     end
   end

   private

   # Never trust parameters from the scary internet, only allow the white list through.
   def interest_params
     params.require(:interest).permit(:level, :comment, :topic_id)
   end
end
