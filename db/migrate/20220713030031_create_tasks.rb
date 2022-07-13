class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.string :name
      t.integer :doses_required
      t.integer :doses_given

      t.timestamps
    end
  end
end
