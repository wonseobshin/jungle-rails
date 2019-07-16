require 'rails_helper'

RSpec.feature "Visitor orders a product", type: :feature, js: true do

  #helper to see images
  def open_asset(file_name)
    File.open(Rails.root.join('db', 'seed_assets', file_name))
  end

  # SETUP
  before :each do
    @user = User.create!(
      name: 'User',
      email: 'user@jungle.com',
      password: 'secure',
      password_confirmation: 'secure'
    )

    @category = Category.create! name: 'Apparel'

    @category.products.create!(
      name:  'Cool shirt',
      description: 'This is a very cool shirt. Impress your friends and family.',
      image: open_asset('apparel1.jpg'),
      quantity: 10,
      price: 64.99
    )
    
  end

  # scenario "They can cart items without logging in" do
  #   # ACT
  #   visit root_path

  #   within "article.product" do
  #     # click_on 'Details', href:'/products/1'
  #     find('header a').click
  #   end
  #   # DEBUG
  #   sleep 1

  #   save_screenshot

  #   # VERIFY
  #   expect(page).to have_css 'section.products-show'
  # end

  scenario "They can cart items after logging in" do
    # ACT
    visit '/login'

    within 'form' do
      fill_in id: 'email', with: 'user@jungle.com'
      fill_in id: 'password', with: 'secure'
  
      click_button 'Submit'
    end

    within "article.product" do
      click_button 'Add'
    end

    # DEBUG
    save_screenshot

    # VERIFY
    expect(page).to have_content 'My Cart (1)'
  end
end