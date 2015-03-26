class Tag < ActiveRecord::Base
  has_many :posts
  has_many :post_tags
end