class Tag < ApplicationRecord
  validates :label, presence: true, uniqueness: true
  delegated_type :tagable, types: %w[Cable Motor], dependent: :destroy, optional: true
end
