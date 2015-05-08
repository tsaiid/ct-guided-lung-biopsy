class Radiologist < ActiveRecord::Base
  has_and_belongs_to_many :biopsies

  validates :no, presence: true, uniqueness: true
  validates :name, presence: true
end
