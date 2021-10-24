require 'rails_helper'

RSpec.describe Api::V1::HousesController, type: :controller do
  # before { allow(controller).to receive(:authorize_request).and_return(true) }

  # describe 'use authorize request before action' do
  #   context 'when authorized' do
  #     it { should use_before_action(:authorize_request) }
  #   end
  # end

  describe 'Get /v1/users' do
    before { get :index }
    context 'when authorized' do
      it { expect(response).to have_http_status(:ok) }
      # it { expect(response.content_type).to include('text/html') }
    end
  end
end
