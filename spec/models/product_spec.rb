require 'rails_helper'
RSpec.describe Product, type: :model do
  describe 'Validations' do
    category = Category.new(name: "testCategory")
    subject{described_class.new(name: "testName", price_cents: 1105, quantity: 10, category: category)}
    it "is not valid if fields are blank" do
      expect(subject).to be_valid
    end

    it "validates name as being present" do
      subject.name = nil
      subject.valid?
      expect(subject.errors[:name].first).to eq"can't be blank"
    end

    it "validates price as being present" do
      subject.price_cents = 11
      subject.valid?
      expect(subject.price_cents)
    end
    it "validates category as being present" do
      subject.category = category
      expect(subject.category)
    end
  end
end
