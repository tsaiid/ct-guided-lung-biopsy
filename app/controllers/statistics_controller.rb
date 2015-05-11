class StatisticsController < ApplicationController
  def index
    @biopsy_count = Biopsy.count
    if @biopsy_count > 0
      @first_date = Biopsy.order(exam_date: :asc).first.exam_date
      @last_date = Biopsy.order(exam_date: :asc).last.exam_date
      @radiologists = Radiologist.all
      @pneumothorax_rate = Biopsy.where.not(pneumothorax_degree: "no").count / @biopsy_count * 100.0
      @pneumothorax_management_overall_rate = Biopsy.where.not(complication_management_drain: nil).count / @biopsy_count * 100.0
      @pneumothorax_management_rate =
        (Biopsy.where.not(pneumothorax_degree: "no").count > 0 ?
          Biopsy.where.not(complication_management_drain: nil).count / Biopsy.where.not(pneumothorax_degree: "no").count :
          0) * 100.0
    end
  end
end
