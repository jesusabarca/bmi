# frozen_string_literal: true

class User < ApplicationRecord
  has_person_name

  validates :email, email: true, presence: true, uniqueness: { case_sensitive: false }
  validates :name, presence: true
  validates :height, numericality: { greater_than: 0 }, if: proc { |u| u.weight > 0 }
  validates :weight, numericality: { greater_than: 0 }, if: proc { |u| u.height > 0 }

  def bmi
    weight / (height**2)
  # rescue ZeroDivisionError
  #   0
  end
end
