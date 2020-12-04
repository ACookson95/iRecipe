class Recipe < ApplicationRecord
  belongs_to :user
  has_many :components
  has_many :steps
end
