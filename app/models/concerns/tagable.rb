# frozen_string_literal: true
module Tagable
  extend ActiveSupport::Concern

  included do
    has_one :tag, as: :tagable, dependent: :nullify
    accepts_nested_attributes_for :tag

    # validates :tag, presence: true
  end
end
