class User < ApplicationRecord
  validates_uniqueness_of :firstName
end
