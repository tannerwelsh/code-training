class CreateTodoLists < ActiveRecord::Migration
  def change
    create_table :todo_lists do |t|
      t.string :title
      t.integer :project_id

      t.timestamps
    end
  end
end
