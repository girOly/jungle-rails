require 'rails_helper'

RSpec.feature 'ProductDetails', type: :feature, js: true do
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |_n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario 'They see all product details' do
    # ACT
    visit root_path
  # first.('.product').click('Details')
  page.find('img', match: :first).click
  puts URI.parse(current_url).to_s

    # DEBUG
    save_screenshot

    # VERIFY
    expect(page).to have_content 'Apparel'
  end
end
