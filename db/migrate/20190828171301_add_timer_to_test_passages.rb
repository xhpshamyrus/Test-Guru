class AddTimerToTestPassages < ActiveRecord::Migration[5.2]
  def change
    add_column :test_passages, :timer, :integer
  end
end
