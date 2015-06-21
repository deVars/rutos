class CreateScrapes < ActiveRecord::Migration
  def change
    create_table :scrapes do |t|
      t.string :subber
      t.string :title
      t.integer :resolution
      t.integer :bit_encoding
      t.string :url
      t.boolean :was_downloaded
      t.string :publish_date

      t.timestamps
    end
  end
end
