require 'rails_helper'

RSpec.describe Property, type: :model do
  before(:each) do
    @property = Property.new
    @user = User.create!(email: "test@test.com", password:"123456")
  end
  context 'validations' do
    it 'is not valid without a title' do
      @property.description = 'A beautiful property'
      expect(@property).not_to be_valid
    end

    it 'is not valid without a description' do
      @property.title = 'Amazing Property'
      expect(@property).not_to be_valid
    end

    it 'is not valid if the price is less than or equal to zero' do
      @property.title = 'Amazing Property'
      @property.description = 'A beautiful property'
      @property.price = 0
      expect(@property).not_to be_valid

      @property.price = -100
      expect(@property).not_to be_valid
    end

    it 'is valid with all required attributes' do
      @property.title = 'Amazing Property'
      @property.description = 'A beautiful property'
      @property.price = 100_000
      @property.area = 100
      @property.bathrooms = 2
      @property.rooms = 1
      @property.user = @user
      expect(@property).to be_valid
    end
  end
end
