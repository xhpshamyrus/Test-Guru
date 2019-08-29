class AddTimePeriodToTests < ActiveRecord::Migration[5.2]
  def change
    add_column :tests, :time_period, :integer
  end
end
