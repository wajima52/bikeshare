class BicyclesController < ApplicationController
    before_action :set_bicycle, only: [:show, :edit, :update, :destroy, :demanders]
    before_action :authenticate_user!, only: [:create, :new, :destroy, :update]
    
 def index
    @bicycles = Bicycle.all.page(params[:page]).per(10)
 end

  def show
    @applicants = @bicycle.applicants.page(params[:page])
  end

  def new
    @bicycle = Bicycle.new
  end

  def create
    @bicycle = current_user.bicycles.build(bicycle_params)

    if @bicycle.save
      flash[:success] = 'bicycle が正常に投稿されました'
      redirect_to @bicycle
    else
      flash.now[:danger] = 'bicycle が投稿されませんでした'
      render :new
    end
  end

  def edit
  end

  def update
    if @bicycle.update(bicycle_params)
      flash[:success] = 'bicycle は正常に更新されました'
      redirect_to @bicycle
    else
      flash.now[:danger] = 'bicycle は更新されませんでした'
      render :edit
    end
  end

  def destroy
    @bicycle.destroy

    flash[:success] = 'bicycle は正常に削除されました'
    redirect_to bicycles_url
  end
  
  def demanders
   @borrowers = @bicycle.borrowers.page(params[:page])
  end
 
 
private

  
  def wantings
    @user = User.find(params[:id])
    @wantings = @user.wantings.page(params[:page])
    counts(@user)
  end


  def set_bicycle
    @bicycle = Bicycle.find(params[:id])
  end
  
  def bicycle_params
    params.require(:bicycle).permit(:name, :place, :content, :image, :user)
  end
  
  

  
end
  