class AddTestsColumnCategoryId < ActiveRecord::Migration[5.2]
  def change
    add_column :tests, :category_id, :integer
  end
end
