class Book < ActiveRecord::Base
  has_many :readers, through: :ownerships
  has_many :ownerships
end
