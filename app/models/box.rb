class Box < ApplicationRecord
  has_many :chocolates, dependent: :destroy

  def got_chocolate(flavor)
    chocolates.create!(flavor:)
  end
end
