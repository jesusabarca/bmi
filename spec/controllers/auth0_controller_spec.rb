require 'rails_helper'

RSpec.describe Auth0Controller do
  describe 'GET success' do
    let(:user) { create :user }

    before { mock_login user }

    it do
      subject { response }

      get :success
      is_expected.to redirect_to user_path(user)
    end
  end

  describe 'GET failure' do
    it do
      get :failure, params: { message: ':(' }
      expect(assigns @error_msg).to include(error_msg: ':(')
    end
  end
end
