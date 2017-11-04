class PagesController < ApplicationController
  def index
  end

  def show
    if user_signed_in?
      @user = current_user
      @bicycle = current_user.bicycles.build  
      @bicycles = current_user.bicycles.order('created_at DESC').page(params[:page])
    end
  end
end
