class Session < ApplicationRecord
  belongs_to :spot
  belongs_to :user
  has_and_belongs_to_many :users , :uniq => true
end
