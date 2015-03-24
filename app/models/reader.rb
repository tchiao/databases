class Reader < ActiveRecord::Base
  has_many :books, through: :ownerships
  has_many :ownerships

end
