class Cable < ApplicationRecord
  include ::Tagable
  belongs_to :cable_type

  validates :length, presence: true, numericality: { greater_than: 0 }
  validates :cable_type, presence: true
end
