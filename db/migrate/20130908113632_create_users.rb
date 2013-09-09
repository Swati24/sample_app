class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.integer :user_type_id
      t.integer :articles_count, :default => 0

      t.timestamps
    end
  end
end
