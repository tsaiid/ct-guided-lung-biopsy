class Biopsy < ActiveRecord::Base
  has_and_belongs_to_many :radiologists

  validates :patient_id, :accession_no, :biopsy_needle_size,
            :coaxial_needle_size, :lesion_size,
            :biopsy_numbers, :formalin_numbers, :saline_numbers,
            :aerobic_swab_numbers, :anaerobic_swab_numbers,
            numericality: { only_integer: true }
  validates :patient_id, :accession_no, :biopsy_needle_size, :use_contrast_media,
            :lesion_location, :lesion_size, :lesion_is_cavitary, :lesion_type,
            :emphysema_degree, :patient_cooperation,
            :pneumothorax_degree, :hemorrhage_degree, :has_hemoptysis, :has_chest_tightness,
            :has_asthma, :biopsy_numbers, :patient_name, :patient_gender, :patient_age, :exam_date,
            :radiologist_ids,
            presence: true
  validates :pleural_distance, presence: true, numericality: { only_integer: true }, unless: 'lesion_location == "other"'

  strip_attributes only: [:patient_id, :accession_no, :patient_name, :patient_age]

  def lesion_location_text
    lesion_location == 'other' ? lesion_location_other : lesion_location
  end

  def impression_text
    impression == 'other' ? impression_other : impression
  end
end
