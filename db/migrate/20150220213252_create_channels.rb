class CreateChannels < ActiveRecord::Migration
  def change
    create_table :channels do |t|
      t.string :channel_name
      t.references :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :channels, :users
    add_index :channels, [:user_id, :created_at]
    #add_index :channels, :channel_name, unique: true
  end
end
