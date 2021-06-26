class AddDetailsToTasks < ActiveRecord::Migration[6.1]
  def change
    add_column :tasks, :memo, :string
    add_column :tasks, :allday, :boolean
  end
end
