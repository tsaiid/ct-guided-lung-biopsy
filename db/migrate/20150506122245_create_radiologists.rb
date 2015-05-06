class CreateRadiologists < ActiveRecord::Migration
  def change
    create_table :radiologists do |t|
      t.string :name, null: false
      t.string :no, null: false

      t.timestamps null: false
    end
  end
end
