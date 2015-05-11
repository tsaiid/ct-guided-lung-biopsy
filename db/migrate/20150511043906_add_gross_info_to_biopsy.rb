class AddGrossInfoToBiopsy < ActiveRecord::Migration
  def change
    add_column :biopsies, :gross, :string, default: "yes"
  end
end
