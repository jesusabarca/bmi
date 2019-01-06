# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User do
  subject { build :user }

  it { is_expected.to validate_presence_of :email }
  it { is_expected.to validate_uniqueness_of(:email).case_insensitive }

  context 'with an invalid email' do
    before { subject.validate }

    subject { build :user, email: 'random@invalid_email' }

    it { is_expected.to be_invalid }
    it { expect(subject.errors.details[:email]).to include(error: :not_an_email) }
  end
end
