require 'rails_helper'

RSpec.describe LandingController do
  describe 'GET #show' do
    it 'is successful' do
      get :show
      expect(response).to be_successful
    end
  end
end
