# frozen_string_literal: true

class BodyMass
  def initialize(weight:, height:)
    @weight = weight
    @height = height
  end

  def index
    return 0.0 unless weight > 0
    return 0.0 unless height > 0

    bmi = weight / (height**2)
    bmi.round(2)
  end

  def category
    return underweight_category if index <= 18.5
    return :normal if index <=25

    overweight_category
  end

  private

  attr_reader :weight, :height

  def underweight_category
    return :very_severely_underweight if index <=15
    return :severely_underweight if index <=16

    :underweight
  end

  def overweight_category
    return :overweight if index <=30
    return :moderately_obese if index <=35
    return :severely_obese if index <=40
    return :very_severely_obese if index <=45
    return :morbidly_obese if index <=50
    return :super_obese if index <=60

    :hyper_obese
  end
end
