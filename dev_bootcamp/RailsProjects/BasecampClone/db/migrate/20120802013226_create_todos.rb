class CreateTodos < ActiveRecord::Migration
  def change
    create_table :todos do |t|
      t.string :text
      t.boolean :complete
      t.integer :todo_list_id

      t.timestamps
    end
  end
end
