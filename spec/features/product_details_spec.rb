require 'rails_helper'

RSpec.feature "ProductDetails", type: :feature, js:true do
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


  scenario "They see the products detail page" do
    # ACT
    visit root_path
    first(:link, 'Details').click
    # DEBUG
    expect(page).to have_css(".product-detail")
    
    #pngs are cooler
    #save_and_open_screenshot('products-stuff.png')
    # VERIFY
   
  end
end
