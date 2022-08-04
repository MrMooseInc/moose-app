class RemoveTimeCompletedFromHistories < ActiveRecord::Migration[7.0]
  def change
    remove_column :histories, :time_completed, :datetime
  end
end
