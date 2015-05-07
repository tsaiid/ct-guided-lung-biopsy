class SeperatePtxMgn < ActiveRecord::Migration
  def change
    remove_column :biopsies, :pneumothorax_management
    add_column :biopsies, :complication_management_drain, :string
    add_column :biopsies, :complication_management_other, :string
  end
end
