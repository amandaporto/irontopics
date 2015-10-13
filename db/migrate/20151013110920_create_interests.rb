class CreateInterests < ActiveRecord::Migration
  def change
    create_table :interests do |t|
      t.references :user, index: true, foreign_key: true
      t.text :comment
      t.integer :level
      t.references :topic, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
