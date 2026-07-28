class CreateAuthors < ActiveRecord::Migration[8.1]
  def change
    create_table :authors do |t|
      t.string :name
      t.integer :age
      t.string :nationality

      t.timestamps
    end
  end
end
