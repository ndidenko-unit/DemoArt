class CreateTags < ActiveRecord::Migration[5.0]
  def change
    create_table :tags do |t|
      t.references :picture, foreign_key: true
      t.string :name
      t.text :text
      t.integer :x
      t.integer :y
      t.integer :w
      t.integer :h

      t.timestamps
    end
  end
end
