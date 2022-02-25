class Chocolate < ApplicationRecord
  enum flavor: { matcha: '녹차', strawberry: '딸기' }
  belongs_to :box
end
