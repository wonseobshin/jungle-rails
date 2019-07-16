require 'rails_helper'

RSpec.feature "Visitor navigates to product show page", type: :feature, js: true do

  #helper to see images
  def open_asset(file_name)
    File.open(Rails.root.join('db', 'seed_assets', file_name))
  end
  
  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    @category.products.create!(
      name:  Faker::Hipster.sentence(3),
      description: Faker::Hipster.paragraph(4),
      image: open_asset('apparel1.jpg'),
      quantity: 10,
      price: 64.99
    )
    
  end

  scenario "They see the product page" do
    # ACT
    visit root_path

    within "article.product" do
      # click_on 'Details', href:'/products/1'
      find('header a').click
    end
    # DEBUG
    sleep 1

    save_screenshot

    # VERIFY
    expect(page).to have_css 'section.products-show'
  end
end