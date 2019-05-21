require 'rails_helper'

RSpec.feature "Visitor add product to cart on homepage", type: :feature, js: true do

  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    15.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end   

  scenario "Click on add to cart for a product" do
    # ACT
    visit root_path

    first('article.product').click_on('Add')

    # DEBUG 
    #  takes screenshot of the page and saves to tmp/capybara
    save_screenshot
    
    # VERIFY
    expect(page).to have_content('My Cart (1)')

  end

end