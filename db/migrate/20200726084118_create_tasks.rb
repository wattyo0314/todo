class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.string :title, null: false
      t.text :memo, null: false
      t.time :time
      t.boolean :finished, default: false, null: false
      t.references :user, foreign_key: true, null: false
      t.timestamps
    end
  end
end
