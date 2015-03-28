class User < ActiveRecord::Base
  has_many :similarities
  has_many :pushes
  validates_uniqueness_of :name
end
