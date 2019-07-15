require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it 'should allow you to create product with good params' do
      electronics = Category.create name: 'electronics'
      product = Product.create name: 'popcorn maker', price: 500, quantity: 5, category: electronics
      #mystery = Mystery.create title: 'The Great Mystery of Water Erosion', pyramid: pyramid
  
      expect(product).to be_valid
    end

    it 'should not allow you to create nameless product' do
      electronics = Category.create name: 'electronics'
      product = Product.create price: 500, quantity: 5, category: electronics
      #mystery = Mystery.create title: 'The Great Mystery of Water Erosion', pyramid: pyramid
  
      expect(product).to_not be_valid
    end

    it 'should not allow you to create price-less product' do
      electronics = Category.create name: 'electronics'
      product = Product.create name: 'popcorn maker', quantity: 5, category: electronics
  
      expect(product).to_not be_valid
    end

    it 'should not allow you to create product without quantity' do
      electronics = Category.create name: 'electronics'
      product = Product.create name: 'popcorn maker', price: 500, category: electronics
  
      expect(product).to_not be_valid
    end

    it 'should not allow you to create category less product' do
      product = Product.create name: 'popcorn maker', price: 500, quantity: 5
  
      expect(product).to_not be_valid
    end
  end
end
