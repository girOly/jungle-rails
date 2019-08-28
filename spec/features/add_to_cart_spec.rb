require 'rails_helper'

RSpec.feature "Visitor navigates to home page", type: :feature, js: true do

  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name: Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "They can see the product details after clicking the product detail page" do
    # ACT
    visit root_path

    # DEBUG / VERIFY

    click_button("Add", match: :first)


    expect(page).to have_text 'My Cart (1)', count: 1

    save_screenshot

  end

end
