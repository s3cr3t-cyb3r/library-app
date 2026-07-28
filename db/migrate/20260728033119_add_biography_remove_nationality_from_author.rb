class AddBiographyRemoveNationalityFromAuthor < ActiveRecord::Migration[8.1]
  def change
    add_column :authors, :biography, :text
    remove_column :authors, :nationality, :string
  end
end
