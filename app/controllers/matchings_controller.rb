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
    matchings_params.each do |id, matching_param|
      matching = Matching.find(id)
      matching.update_attributes(matching_param)
    end
    flash[:success] = '希望者に返信しました。'
    redirect_back(fallback_location: root_path)
  end
  
  private
  
  def matchings_params
    params.permit(matchings: [:renter_id,:borrower_id, :bicycle_id, :matching_status, :return_message])[:matchings]
  end
    
end


 
