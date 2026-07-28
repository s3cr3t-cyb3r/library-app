class CreateBooks < ActiveRecord::Migration[8.1]
  def change
    create_table :books do |t|
      t.text :title
      t.text :genre
      t.integer :year_published
      t.boolean :available

      t.timestamps
    end
  end
end
