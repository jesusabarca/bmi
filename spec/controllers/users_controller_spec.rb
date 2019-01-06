require 'rails_helper'

RSpec.describe UsersController do
  let(:user) { create :user }

  subject { response }

  before do
    session[:userinfo] = OmniAuth.config.mock_auth[:auth0]
  end

  describe 'GET #show' do
    context 'with his/her information' do
      it do
        get :show, params: { id: user.id }
        is_expected.to be_successful
      end
    end

    context "with other user's information" do
      let(:user) { create :user, email: 'another@user.com' }

      it do
        expect do
          get :show, params: { id: user.id }
        end.to raise_error(CanCan::AccessDenied)
      end
    end
  end

  describe 'PUT #update' do
    let(:params) do
      {
        id: user.id,
        user: { height: 1.70, weight: 83.5 }
      }
    end

    context 'with his/her information' do
      it do
        put :update, params: params
        is_expected.to be_successful
      end
    end

    context "with other user's information" do
      let(:user) { create :user, email: 'another@user.com' }

      it do
        expect do
          put :update, params: params
        end.to raise_error(CanCan::AccessDenied)
      end
    end
  end
end
