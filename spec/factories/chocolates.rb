FactoryBot.define do
  factory :chocolate do
    box_id { 1 }
    flavor { Chocolate.flavors[:matcha] }
  end
end
