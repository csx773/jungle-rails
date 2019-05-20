require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
  # testing for validations below
    @category = Category.new(name: 'Clothing')
    subject { described_class.new(
      name: 'Ugly Sweater',
      price: 120,
      quantity: 10,
      category: @category
    ) }
    
    it 'should be able to save valid product and category' do
      @category = Category.new(
        name: 'Sweater'
      )
      expect(@category.save!).to be true

      expect(subject.save!).to be true
    end

    it 'should validate for presence of name' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'should validate for presence of price' do
      subject.price = nil
      expect(subject).to_not be_valid
    end

    it 'should validate for presence of quantity' do
      subject.quantity = nil
      expect(subject).to_not be_valid
    end

    it 'should validate for presence of category' do
      subject.category = nil
      expect(subject).to_not be_valid
    end
  
  end 
end
