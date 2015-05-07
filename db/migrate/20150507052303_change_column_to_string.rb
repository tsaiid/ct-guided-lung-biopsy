class ChangeColumnToString < ActiveRecord::Migration
  def change
    change_column :biopsies, :use_contrast_media, :string
    change_column :biopsies, :lesion_is_cavitary, :string
    change_column :biopsies, :has_hemoptysis, :string
    change_column :biopsies, :has_chest_tightness, :string
    change_column :biopsies, :has_asthma, :string
  end
end
