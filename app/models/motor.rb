class Motor < ApplicationRecord
  include ::Tagable
  validates :power, presence: true, numericality: { greater_than: 0 }
end
