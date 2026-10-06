require "rails_helper"

RSpec.describe Product, type: :model do
    subject(:product) { build(:product) }

    describe "validations" do
        it { is_expected.to validate_presence_of(:name).with_message("cannot be blank!") }
        it { is_expected.to validate_numericality_of(:inventory_count).is_greater_than_or_equal_to(0) }
    end
end
