require 'rails_helper'

RSpec.describe Api::V1::HousesController, type: :controller do
  let(:valid_attributes) do
    {
      house_name: 'Faker::Restaurant.name',
      city: 'Faker::Address.city',
      address: 'Faker::Address.full_address',
      description_short: 'Faker::Restaurant.description',
      description_long: 'Faker::Lorem.paragraphs(number: 1)',
      price: '89.12'
    }
  end

  let(:invalid_attributes) do
    { price: nil }
  end

  describe 'Get #index' do
    it 'returns a success response' do
      get :index, params: {}
      expect(response).to be_successful
    end
  end

  describe 'Get #show' do
    it 'returns a success response' do
      house = create(:house)
      get :show, params: { id: house.to_param }
      expect(response).to be_successful
    end
  end

  describe 'Post #create' do
    context 'with valid params' do
      it 'create a new house' do
        expect do
          post :create, params: { house: valid_attributes }
        end.to change(House, :count).by(1)
      end

      it 'returns a 201 status code' do
        post :create, params: { house: valid_attributes }
        expect(response).to have_http_status(:created)
      end
    end

    context 'with invalid params' do
      it 'does not create a new house' do
        expect do
          post :create, params: { house: invalid_attributes }
        end.to change(House, :count).by(0)
      end

      it 'returns a 422 status code' do
        post :create, params: { house: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      let(:new_attributes) do
        {
          house_name: 'Home Sweet Home',
          city: 'Buea, Cameroon'
        }
      end

      it 'updates the requested house' do
        house = create(:house)
        put :update, params: { id: house.to_param, house: new_attributes }
        house.reload
        expect(house.attributes).to include('house_name' => 'Home Sweet Home')
      end

      it 'returns a 200 status code' do
        house = create(:house)

        put :update, params: { id: house.to_param, house: valid_attributes }
        expect(response).to have_http_status(:ok)
      end
    end
    context 'with invalid params' do
      it 'returns a 422 status code' do
        house = create(:house)

        put :update, params: { id: house.to_param, house: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested house' do
      house = create(:house)
      expect do
        delete :destroy, params: { id: house.to_param }
      end.to change(House, :count).by(-1)
    end
  end
end
