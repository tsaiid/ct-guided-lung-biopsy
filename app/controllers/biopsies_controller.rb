class BiopsiesController < ApplicationController
  def index
    @biopsies = Biopsy.all
  end

  def show
    @biopsy = Biopsy.find(params[:id])
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
    biopsy_params_without_radiologists = biopsy_params.except(:radiologists)
    @biopsy = Biopsy.new(biopsy_params_without_radiologists)
    biopsy_params[:radiologists].each do |r|
      @biopsy.radiologists << Radiologist.where(id: r)
    end

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
  params.require(:biopsy).permit( :patient_id, :patient_name, :patient_age, :patient_gender,
                                  :accession_no, :exam_date,
                                  :biopsy_needle_size, :coaxial_needle_size, :use_contrast_media, :anesthesia,
                                  :position, :lesion_location, :lesion_size, :lesion_is_cavitary, :lesion_type, :pleural_distance,
                                  :emphysema_degree, :patient_cooperation,
                                  :pneumothorax_degree, :pneumothorax_management,
                                  :hemorrhage_degree, :has_hemoptysis, :has_chest_tightness, :has_asthma, :other_complications,
                                  :biopsy_numbers, :formalin_numbers, :saline_numbers, :aerobic_swab_numbers, :anaerobic_swab_numbers,
                                  radiologists: [])
end