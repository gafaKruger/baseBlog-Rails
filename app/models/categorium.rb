class Categorium < ActiveRecord::Base
  has_and_belongs_to_many :posts, :through => :categoria_posts
end
