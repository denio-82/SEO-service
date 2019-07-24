class CreateSites < ActiveRecord::Migration[5.2]
  def change
    create_table :sites do |t|
      t.string :domain
      t.boolean :https
      t.boolean :www_subdomain

      t.timestamps
    end
  end
end
