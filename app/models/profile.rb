# frozen_string_literal: true
class Profile < ApplicationRecord
  has_many :posts
end
