class RelationshipsController < ApplicationController
  before_action :authenticate_user!
  
  def create
    bicycle = Bicycle.find(params[:rental_bicycle_id])
    
    current_user.wanting(bicycle)
    current_user.demand(bicycle)
    flash[:success] = '"借りたいリスト"に登録しました。'
    redirect_to bicycle
  end

  def destroy
    bicycle = Bicycle.find(params[:rental_bicycle_id])
    current_user.unwanting(bicycle)
    current_user.undemand(bicycle)
    flash[:success] = '"借りたいリスト"から外しました。'
    redirect_to bicycle
  end
end
