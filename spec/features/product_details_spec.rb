require 'rails_helper'

RSpec.feature "Navigate to single product details page", type: :feature, js: true do

  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end   

  scenario "Clicking on product and going to product detail page" do
    # ACT
    visit root_path

    first('article.product h4').click

    # DEBUG 
    #  takes screenshot of the page and saves to tmp/capybara
    sleep 3
    save_screenshot
    # puts the page.html from test to console ONLY
    # puts page.html
    
    # VERIFY
    expect(page).to have_css('article.product-detail img.main-img')

  end

end