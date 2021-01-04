class Place < ApplicationRecord
  belongs_to :category
  belongs_to :district
  has_many :comments, dependent: :destroy
end
