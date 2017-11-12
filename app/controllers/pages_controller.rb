class PagesController < ApplicationController
  before_action :authenticate_user!
  def index
  end

  def show
      @user = current_user
      @bicycle = current_user.bicycles.build  
      @bicycles = current_user.bicycles.order('created_at DESC').page(params[:page])
      counts(@bicycles)
  end
  
  def applicants
    @bicyce = Bicycle.find(params[:id])
    @applicants = @bicycle.applicants.page(params[:page])
    @count_applicants = @bicycle.applicants.count
  end
  
  def wantings
    @user = User.find(params[:id])
    @wantings = @user.wantings.page(params[:page])
    @count_wantings = @user.wantings.count
  end
  
end
