class SetDefaultInCheckedOutInBooks < ActiveRecord::Migration[8.1]
  def change
    change_column_default :books, :checked_out, from: nil, to: false
  end
end
