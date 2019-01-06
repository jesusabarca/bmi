# frozen_string_literal: true

class User < ApplicationRecord
  has_person_name

  validates :email, email: true, presence: true, uniqueness: { case_sensitive: false }
  validates :name, presence: true
end
