class Office < ApplicationRecord
  belongs_to :building

  validates :number, presence: true, numericality: true
  validates :building_id, presence: true
 

end
