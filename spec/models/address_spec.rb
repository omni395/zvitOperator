require 'rails_helper'

RSpec.describe Address, type: :model do

  before { @address = FactoryGirl.create(:address) }

  describe 'has max length 30 in field:' do
    it '#user_country' do
      @address.user_country = "a" * 31
      expect(@address).not_to be_valid
    end
    it '#user_region' do
      @address.user_region = "a" * 31
      expect(@address).not_to be_valid
    end
    it '#user_city' do
      @address.user_city = "a" * 31
      expect(@address).not_to be_valid
    end
    it '#user_street' do
      @address.user_street = "a" * 31
      expect(@address).not_to be_valid
    end
    it '#user_building' do
      @address.user_building = "a" * 31
      expect(@address).not_to be_valid
    end
    it '#user_apartment' do
      @address.user_apartment = "a" * 31
      expect(@address).not_to be_valid
    end
  end

  describe 'has a downcase format' do
    let(:mixed_user_country) { 'rU' }
    let(:mixed_user_region) { 'crImEa' }
    let(:mixed_user_city) { 'SevasTOPol' }
    let(:mixed_user_street) { 'LENIna' }
    let(:mixed_user_building) { '10B' }
    let(:mixed_user_apartment) { '4F' }

    it '#use_country' do
      @address.user_country = mixed_user_country
      @address.save
      expect(@address.user_country).to eq mixed_user_country.downcase
    end
    it '#user_region' do
      @address.user_region = mixed_user_region
      @address.save
      expect(@address.user_region).to eq mixed_user_region.downcase
    end
    it '#user_city' do
      @address.user_city = mixed_user_city
      @address.save
      expect(@address.user_city).to eq mixed_user_city.downcase
    end
    it '#user_street' do
      @address.user_street = mixed_user_street
      @address.save
      expect(@address.user_street).to eq mixed_user_street.downcase
    end
    it '#user_building' do
      @address.user_building = mixed_user_building
      @address.save
      expect(@address.user_building).to eq mixed_user_building.downcase
    end
    it '#user_apartment' do
      @address.user_apartment = mixed_user_apartment
      @address.save
      expect(@address.user_apartment).to eq mixed_user_apartment.downcase
    end
  end
end
