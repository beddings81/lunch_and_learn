class User < ApplicationRecord
  has_many :favorites
  validates_presence_of :name, :email, :api_key
  validates_uniqueness_of :email, :api_key
end