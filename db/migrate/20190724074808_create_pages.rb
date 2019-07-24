class CreatePages < ActiveRecord::Migration[5.2]
  def change
    create_table :pages do |t|
      t.string :url, null: false
      t.belongs_to :site, foreign_key: true

      t.timestamps
    end

    add_index :pages, :url
  end
end
