# frozen_string_literal: true

# stekje model
class Stekje < ApplicationRecord
  has_one_attached :file
  belongs_to :category
end
