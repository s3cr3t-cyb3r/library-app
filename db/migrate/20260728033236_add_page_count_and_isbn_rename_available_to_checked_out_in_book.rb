class AddPageCountAndIsbnRenameAvailableToCheckedOutInBook < ActiveRecord::Migration[8.1]
  def change
    add_column :books, :page_count, :integer
    add_column :books, :isbn, :integer
    rename_column :books, :available, :checked_out
  end
end
