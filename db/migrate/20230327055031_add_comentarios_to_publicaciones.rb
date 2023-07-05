class AddComentariosToPublicaciones < ActiveRecord::Migration[7.0]
  def change
    add_reference(:comentarios, :publicacion, {:null=>false, :foreign_key=>true})
  end
end
