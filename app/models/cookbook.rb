class Cookbook < ApplicationRecord
  belongs_to :user
  has_many :cookbook_recipes
end
