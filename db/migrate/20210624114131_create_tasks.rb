class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.string :title
      t.date :startdate
      t.date :finishtime


      t.timestamps
    end
  end
end
