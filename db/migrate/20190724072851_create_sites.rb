class CreateSites < ActiveRecord::Migration[5.2]
  def change
    create_table :sites do |t|
      t.string :domain, null: false
      t.boolean :https, default: false
      t.boolean :www_subdomain, default: false

      t.timestamps
    end

    add_index :sites, :domain
  end
end
