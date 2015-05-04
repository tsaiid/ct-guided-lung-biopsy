class BiopsiesController < ApplicationController
  def index
    @biopsies = Biopsy.all
  end

  def new
    @biopsy = Biopsy.new
    @biopsy.patient_id = params[:patient_id] unless params[:patient_id].nil?
    @biopsy.accession_no = params[:accession_no] unless params[:accession_no].nil?
    @biopsy.patient_name = params[:patient_name] unless params[:patient_name].nil?
    @biopsy.patient_age = params[:patient_age] unless params[:patient_age].nil?
    @biopsy.patient_gender = params[:patient_gender] unless params[:patient_gender].nil?
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
  params.require(:biopsy).permit(:patient_id, :accession_no, :patient_name, :patient_age, :patient_gender)
end