module UsuariosHelper
  def can_authorize
    authorize && @usuario.adm
  end

  def can_post
    authorize && @usuario.adm
  end

  def can_comment
    authorize
  end
end
