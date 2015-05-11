class AddImpressionToBiopsy < ActiveRecord::Migration
  def change
    add_column :biopsies, :impression, :string, null: false, default: "cancer"
    add_column :biopsies, :impression_other, :string
  end
end
