class CreateBiopsiesRadiologistsAssociation < ActiveRecord::Migration
  def change
    create_table :biopsies_radiologists, id: false do |t|
      t.belongs_to :biopsy, index: true
      t.belongs_to :radiologist, index: true
    end
  end
end
