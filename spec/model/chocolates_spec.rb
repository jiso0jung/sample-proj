require 'rails_helper'

RSpec.describe Chocolate, type: :model do
  let(:box) { create(:box) }

  before do
    box.got_chocolate(Chocolate.flavors[:matcha])
    box.got_chocolate(Chocolate.flavors[:strawberry])
  end

  it do
    p box.chocolates.first.flavor_before_type_cast
    box.chocolates.map { |c| p c.flavor_before_type_cast }
    should belong_to(:box)
  end
end
