class Comentario < ActiveRecord::Base
  belongs_to :post
  belongs_to :usuario
end
