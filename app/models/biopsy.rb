class Biopsy < ActiveRecord::Base
  has_and_belongs_to_many :radiologists

  validates :patient_id, :accession_no, :biopsy_needle_size,
            :coaxial_needle_size, :lesion_size, :pleural_distance,
            :biopsy_numbers, :formalin_numbers, :saline_numbers,
            :aerobic_swab_numbers, :anaerobic_swab_numbers,
            numericality: { only_integer: true }
  validates :patient_id, :accession_no, :biopsy_needle_size, :use_contrast_media,
            :lesion_size, :lesion_is_cavitary, :lesion_type,
            :pleural_distance, :emphysema_degree, :patient_cooperation,
            :pneumothorax_degree, :hemorrhage_degree, :has_hemoptysis, :has_chest_tightness,
            :has_asthma, :biopsy_numbers, :patient_name, :patient_gender, :patient_age, :exam_date,
            presence: true
end
