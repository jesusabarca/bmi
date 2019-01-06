require 'rails_helper'

RSpec.describe UsersController do
  let(:user) { create :user }

  subject { response }

  before do
    session[:userinfo] = OmniAuth.config.mock_auth[:auth0]
  end

  describe 'GET #show' do
    it do
      get :show, params: { id: user.id }
      is_expected.to be_successful
    end
  end

  describe 'PUT #update' do
    let(:params) do
      {
        id: user.id,
        user: { height: 1.70, weight: 83.5 }
      }
    end

    it do
      put :update, params: params
      is_expected.to be_successful
    end
  end
end
