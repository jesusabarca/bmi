require 'rails_helper'

RSpec.describe LandingController do
  subject { response }

  describe 'GET #show' do
    it do
      get :show
      is_expected.to be_successful
    end

    context 'when logged in' do
      let(:user) { create :user }

      before { mock_login user }

      it do
        get :show
        is_expected.to redirect_to user_path(user)
      end
    end
  end
end
