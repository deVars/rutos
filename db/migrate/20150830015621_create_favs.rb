class CreateFavs < ActiveRecord::Migration
  def change
    create_table :favs do |t|
      t.string :title
      t.string :subber
      t.integer :resolution
      t.references :user, index: true, foreign_key: true

      t.timestamps
    end
  end
end
