class CreateBiopsies < ActiveRecord::Migration
  def change
    create_table :biopsies do |t|
      t.string :patient_id, null: false
      t.string :accession_no, null: false
      t.integer :biopsy_needle_size, null: false
      t.integer :coaxial_needle_size
      t.boolean :use_contrast_media, null: false
      t.string :anesthesia

      t.string :position, null: false
      t.string :lesion_location, null: false
      t.integer :lesion_size, null: false
      t.boolean :lesion_is_cavitary, null: false
      t.string :lesion_type, null: false
      t.integer :pleural_distance, null: false
      t.string :emphysema_degree, null: false
      t.string :patient_cooperation, null: false

      t.string :pneumothorax_degree, null: false
      t.string :pneumothorax_management
      t.string :hemorrhage_degree, null: false
      t.boolean :has_hemoptysis, null: false
      t.boolean :has_chest_tightness, null: false
      t.boolean :has_asthma, null: false
      t.string :other_complications

      t.integer :biopsy_numbers, null: false
      t.integer :formalin_numbers
      t.integer :saline_numbers
      t.integer :aerobic_swab_numbers
      t.integer :anaerobic_swab_numbers

      t.timestamps null: false
    end
  end
end
