class BiopsiesController < ApplicationController
  def index
    @biopsies = Biopsy.order(exam_date: :desc)
  end

  def show
    @biopsy = Biopsy.find(params[:id])
  end

  def new
    @biopsy = Biopsy.new
    @biopsy.exam_date = params[:exam_date].nil? ? Time.now.strftime('%Y-%m-%d') : params[:exam_date]
    @biopsy.patient_id = params[:patient_id] unless params[:patient_id].nil?
    @biopsy.accession_no = params[:accession_no] unless params[:accession_no].nil?
    @biopsy.patient_name = params[:patient_name] unless params[:patient_name].nil?
    @biopsy.patient_age = params[:patient_age] unless params[:patient_age].nil?
    @biopsy.patient_gender = params[:patient_gender] unless params[:patient_gender].nil?
  end

  def create
    @biopsy = Biopsy.new(biopsy_params)

    if @biopsy.save
      redirect_to action: "show", id: @biopsy.id
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
    if ["127.0.0.1", "192.168.197.209"].include?(request.remote_ip)
      @biopsy.destroy
      flash[:success] = "Entry deleted."
    else
      flash[:notice] = "You cannot delete this item. Please contact admin."
    end

    redirect_to :action => :index
  end
end

private

def biopsy_params
  params.require(:biopsy).permit( :patient_id, :patient_name, :patient_age, :patient_gender,
                                  :accession_no, :exam_date, :impression, :impression_other,
                                  :biopsy_needle_size, :coaxial_needle_size, :use_contrast_media, :anesthesia,
                                  :position, :lesion_location, :lesion_location_other, :lesion_size, :lesion_is_cavitary, :lesion_type, :pleural_distance,
                                  :emphysema_degree, :patient_cooperation,
                                  :pneumothorax_degree, :hemorrhage_degree, :has_hemoptysis, :has_chest_tightness, :has_asthma, :other_complications,
                                  :complication_management_drain, :complication_management_other,
                                  :biopsy_numbers, :formalin_numbers, :saline_numbers, :aerobic_swab_numbers, :anaerobic_swab_numbers, :tb_numbers,
                                  radiologist_ids: [])
end