class Boat < ApplicationRecord
  belongs_to :user
  has_one_attached :photo
  has_many :bookings, dependent: :destroy
  validates :name, presence: true
  validates :description, presence: true
  validates :location, presence: true
  validates :price_per_day, presence: true

  include PgSearch::Model
  pg_search_scope :search_by_location_and_name,
    against: [ :location, :name ],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }
end
