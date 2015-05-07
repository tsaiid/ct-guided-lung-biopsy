class AddTbNumberToBiopsy < ActiveRecord::Migration
  def change
    add_column :biopsies, :tb_numbers, :integer
  end
end
