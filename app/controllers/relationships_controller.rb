class RelationshipsController < ApplicationController
  def create
    bicycle = Bicycle.find(params[:rental_bicycle_id])
    current_user.wanting(bicycle)
    flash[:success] = '"借りたいリスト"に登録しました。'
    redirect_to bicycle
  end

  def destroy
    bicycle = Bicycle.find(params[:rental_bicycle_id])
    current_user.unwanting(bicycle)
    flash[:success] = '"借りたいリスト"から外しました。'
    redirect_to bicycle
  end
end
