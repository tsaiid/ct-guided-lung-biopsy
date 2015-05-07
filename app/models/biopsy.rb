class Biopsy < ActiveRecord::Base
  has_and_belongs_to_many :radiologists
end
