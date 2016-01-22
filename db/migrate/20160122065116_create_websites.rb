class CreateWebsites < ActiveRecord::Migration
  def change
    create_table :websites do |t|
      t.string :url
      t.timestamps
    end

    create_table :photos do |t|
      t.string :image
      t.integer :website_id
      t.timestamps
    end
  end
end