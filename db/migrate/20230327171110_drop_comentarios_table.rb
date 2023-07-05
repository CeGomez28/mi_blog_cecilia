class DropComentariosTable < ActiveRecord::Migration[7.0]
  def change
    drop_table :comentarios
  end
end
