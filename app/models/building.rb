class Building < ApplicationRecord
  has_many :office
  has_one_attached :picture 

  validates :name, presence: true
  validates :name, uniqueness: {scope: [:city, :address]} 
  validates :city, presence: true
  validates :address, presence: true
end
