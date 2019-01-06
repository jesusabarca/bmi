# frozen_string_literal: true

class EmailValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    return if value.blank?
    return if value.to_s.match? URI::MailTo::EMAIL_REGEXP

    record.errors.add attribute, :not_an_email
  end
end
