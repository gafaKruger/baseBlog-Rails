class CategoriaPost < ActiveRecord::Base
  belongs_to :categoria
  belongs_to :post
end
