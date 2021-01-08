class Place < ApplicationRecord
  belongs_to :category
  belongs_to :district
  has_many :comments, dependent: :destroy
  validates :name, presence: true
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  has_one_attached :photo
end

