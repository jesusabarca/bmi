# frozen_string_literal: true

require 'rails_helper'
require 'cancan/matchers'

RSpec.describe Ability do
  describe 'User' do
    let(:user){ create :user }

    subject(:ability) { Ability.new(user) }

    it { is_expected.to_not be_able_to(:manage, User.new) }
    it { is_expected.to be_able_to(:manage, user) }
  end
end
