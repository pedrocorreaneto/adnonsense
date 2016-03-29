class CreateCreatives < ActiveRecord::Migration
  def change
    create_table :creatives do |t|
      t.decimal :bid
      t.text :adtext
      t.references :ad, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
