class ChangePleuralDistanceCanBeNull < ActiveRecord::Migration
  def change
    change_column :biopsies, :pleural_distance, :integer, null: true
  end
end
