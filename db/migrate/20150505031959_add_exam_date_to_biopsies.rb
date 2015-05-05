class AddExamDateToBiopsies < ActiveRecord::Migration
  def change
    add_column :biopsies, :exam_date, :date
  end
end
