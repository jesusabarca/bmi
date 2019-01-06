require 'rails_helper'

RSpec.describe UsersController do
  let(:user) { create :user }

  subject { response }

  before { mock_login user }

  describe 'GET #show' do
    context 'with his/her information' do
      it do
        get :show, params: { id: user.id }
        is_expected.to be_successful
      end
    end

    context "with other user's information" do
      let(:another_user) { create :user, email: 'another@user.com' }

      it do
        expect do
          get :show, params: { id: another_user.id }
        end.to raise_error(CanCan::AccessDenied)
      end
    end
  end

  describe 'PUT #update' do
    context 'with his/her information' do
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

    context "with other user's information" do
      let(:another_user) { create :user, email: 'another@user.com' }
      let(:params) do
        {
          id: another_user.id,
          user: { height: 1.70, weight: 83.5 }
        }
      end

      it do
        expect do
          put :update, params: params
        end.to raise_error(CanCan::AccessDenied)
      end
    end
  end
end
