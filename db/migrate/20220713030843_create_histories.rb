class CreateHistories < ActiveRecord::Migration[7.0]
  def change
    create_table :histories do |t|
      t.integer :task_id
      t.datetime :time_completed
      t.boolean :all_tasks_completed

      t.timestamps
    end
  end
end
