class AddUserIdToCategories < ActiveRecord::Migration[5.0]
  def change
    add_column :categories, :user_id, :integer, foreign_key: true
  end
end
