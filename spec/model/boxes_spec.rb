require 'rails_helper'

RSpec.describe Box, type: :model do
  it { should have_many(:chocolates) }
end
