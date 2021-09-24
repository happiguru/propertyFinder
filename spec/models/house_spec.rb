require 'rails_helper'

RSpec.describe House, type: :model do
  describe 'Associations' do
    it { should have_many(:favourites) }
    it { should have_many(:users).through(:favourites) }
  end

  describe 'Validation' do
    it { is_expected.to validate_presence_of(:house_name) }
    it { is_expected.to validate_presence_of(:city) }
    it { should validate_presence_of(:image)}
    it { is_expected.to validate_presence_of(:address) }
    it { is_expected.to validate_presence_of(:description_short) }
    it { is_expected.to validate_presence_of(:price) }
  end
end
