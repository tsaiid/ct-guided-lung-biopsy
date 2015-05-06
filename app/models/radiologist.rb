class Radiologist < ActiveRecord::Base
  validates :no, presence: true
  validates :name, presence: true
end
