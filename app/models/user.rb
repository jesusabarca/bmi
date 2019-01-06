# frozen_string_literal: true

class User < ApplicationRecord
  validates :email, email: true, presence: true, uniqueness: { case_sensitive: false }
end
