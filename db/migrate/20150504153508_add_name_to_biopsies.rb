class AddNameToBiopsies < ActiveRecord::Migration
  def change
    add_column :biopsies, :patient_name, :string
    add_column :biopsies, :patient_gender, :string
    add_column :biopsies, :patient_age, :string
  end
end
