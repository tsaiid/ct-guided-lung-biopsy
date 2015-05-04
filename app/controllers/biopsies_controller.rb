class BiopsiesController < ApplicationController
  def index
    @biopsies = Biopsy.all
  end

  def new
    @biopsy = Biopsy.new
  end

  def create
    @biopsy = Biopsy.new(biopsy_params)
    if @biopsy.save
      redirect_to :action => :index
    else
      render :action => :new
    end
  end

  def edit
    @biopsy = Biopsy.find(params[:id])
  end

  def update
    @biopsy = Biopsy.find(params[:id])
    @biopsy.update(biopsy_params)

    redirect_to :action => :show, :id => @biopsy
  end

  def destroy
    @biopsy = Biopsy.find(params[:id])
    @biopsy.destroy

    redirect_to :action => :index
  end
end

private

def biopsy_params
  params.require(:biopsy).permit(:patient_id, :accession_no)
end