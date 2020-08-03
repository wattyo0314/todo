class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.string :title, null: false
      t.text :memo, null: false
      t.time :time
      t.references :user, foreign_key: true
      t.references :list, foreign_key: true
      t.timestamps
    end
  end
end
