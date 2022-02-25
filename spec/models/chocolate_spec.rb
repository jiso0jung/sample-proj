require 'rails_helper'

RSpec.describe Chocolate, type: :model do
  let(:box) { create(:box) }

  before do
    box.got_chocolate(Chocolate.flavors[:matcha])
    box.got_chocolate(Chocolate.flavors[:strawberry])
  end

  it do
    chocolates = box.chocolates
    p chocolates.first.flavor_before_type_cast
    p chocolates[0].flavor_before_type_cast

    chocolates = Chocolate.where(box:)
    p chocolates.first.flavor_before_type_cast
    p chocolates[0].flavor_before_type_cast

    should belong_to(:box)
  end
end
