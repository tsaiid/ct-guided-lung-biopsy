class AddLocationOtherTextToBiopsy < ActiveRecord::Migration
  def change
    add_column :biopsies, :lesion_location_other, :string
  end
end
