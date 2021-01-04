class Place < ApplicationRecord
  belongs_to :category
  belongs_to :district
end
