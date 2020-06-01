class Boat < ApplicationRecord
  belongs_to :user
  validates :name, presence: true
  validates :description, presence: true
  validates :location, presence: true
  validates :price_per_day, presence: true
end
