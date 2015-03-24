class Ownership < ActiveRecord::Base
  belongs_to :reader
  belongs_to :book

  default_scope {order("status")}
end
