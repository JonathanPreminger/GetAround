require 'rails_helper'

RSpec.describe Car, :type => :model do
  it "is valid with valid attributes" do
    expect(Car.new).not_to be_valid
end

  describe 'Database' do
    it { is_expected.to have_db_column(:id).of_type(:integer) }
    it { is_expected.to have_db_column(:available_from).of_type(:date)}
    it { is_expected.to have_db_column(:available_to).of_type(:date)}
    it { is_expected.to have_db_column(:price_per_km).of_type(:integer) }
    it { is_expected.to have_db_column(:price_per_day).of_type(:integer) }
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of(:price_per_km) }
    it { is_expected.to validate_presence_of(:price_per_day) }
    it { is_expected.to validate_presence_of(:available_from) }
    it { is_expected.to validate_presence_of(:available_to) }
  end

  describe 'Associations' do
    it { is_expected.to belong_to(:user) }
  end
end
