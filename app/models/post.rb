class Post < ActiveRecord::Base
  has_many :comentarios
  has_and_belongs_to_many :categorias, :through => :categoria_posts
  #has_one :categoria
  belongs_to :usuario

  validates_presence_of :titulo, :corpo, :autor, :usuario
  validates_length_of :titulo,  minimum: 2, maximum: 70, allow_blank: true
  validates_length_of :autor,  minimum: 2, maximum: 50, allow_blank: true
end
