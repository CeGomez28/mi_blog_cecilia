class CreatePublicacions < ActiveRecord::Migration[6.1]
  def change
    create_table :publicacions do |t|
      t.text :titulo
      t.text :descripcion
      t.references :user, null: false, foreign_key: true, type: :bigint

      t.timestamps
    end
  end
end
