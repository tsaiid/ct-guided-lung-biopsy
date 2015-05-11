class RadiologistsController < ApplicationController
  def index
    @radiologists = Radiologist.all
  end

  def new
    @radiologist = Radiologist.new
  end

  def create
    @radiologist = Radiologist.new(radiologist_params)
    if @radiologist.save
      redirect_to :action => :index
    else
      render :action => :new
    end
  end

  def edit
    @radiologist = Radiologist.find(params[:id])
  end

  def show
    @radiologist = Radiologist.find(params[:id])
  end

  def update
    @radiologist = Radiologist.find(params[:id])
    @radiologist.update(biopsy_params)

    redirect_to :action => :show, :id => @radiologist
  end

  def destroy
    @radiologist = Radiologist.find(params[:id])
    if ["127.0.0.1", "192.168.197.209"].include?(request.remote_ip)
      @radiologist.destroy
      flash[:success] = "Entry deleted."
    else
      flash[:notice] = "You cannot delete this item. Please contact admin."
    end

    redirect_to :action => :index
  end

private

  def radiologist_params
    params.require(:radiologist).permit(:no, :name)
  end
end
