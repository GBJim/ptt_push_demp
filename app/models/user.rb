class User < ActiveRecord::Base
  has_many :similarities
  has_many :pushes
end
