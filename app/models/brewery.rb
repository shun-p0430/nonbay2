class Brewery < ApplicationRecord
  with_options presence: true do
    validates :name
    validates :area_id
  end
  
  has_many :brands
  belongs_to :area
end
