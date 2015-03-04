class Book < ActiveRecord::Base
  has_many :readers, through: :libraries
  has_many :libraries
end
