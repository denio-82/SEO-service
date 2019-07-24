class CreateRobotsTxts < ActiveRecord::Migration[5.2]
  def change
    create_table :robots_txts do |t|
      t.references :site, foreign_key: true
      t.text :content, null: false
      t.string :last_modified

      t.timestamps
    end
  end
end
