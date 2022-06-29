class Station < ApplicationRecord
  belongs_to :rent_house, inverse_of: :stations
end
