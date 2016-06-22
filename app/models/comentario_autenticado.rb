class ComentarioAutenticado < Comentario
  belongs_to :comentario
  belongs_to :usuario
end
