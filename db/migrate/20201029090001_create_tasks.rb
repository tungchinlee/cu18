class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.string :title
      t.text :content
      t.time :start_time
      t.time :end_time
      t.string :priority
      t.string :status
      t.string :tag

      t.timestamps
    end
  end
end
