class MatchingsController < ApplicationController
  before_action :authenticate_user!
  
  def create
    bicycle = Bicycle.find(params[:bicycle_id])
    current_user.demand(bicycle)
  end

  def destroy
    bicycle = Bicycle.find(params[:bicycle_id])
    current_user.undemand(bicycle)
  end
  
  def update
    @matching = Matching.find(params[:id])
    @matching.update(matching_params)
    flash[:success] = '希望者に返信しました。'
    redirect_to :back
  end
  
  private
  
  def matching_params
   params.require(:matching).permit(:renter_id,:borrower_id, :bicycle_id, :matching_status, :return_message)
  end
    
end


 
