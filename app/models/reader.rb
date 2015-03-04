class Reader < ActiveRecord::Base
  has_many :books, through: :libraries
  has_many :libraries
end
