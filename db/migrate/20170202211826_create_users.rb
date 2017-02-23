class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.timestamps
      t.references :agent, foreign_key: true, on_update: :cascade, on_delete: :nullify
      t.inet :ip
      t.boolean :super_user, default: false, null: false
      t.boolean :allow_login, default: true, null: false
      t.boolean :hide_profile, default: false, null: false
      t.boolean :email_confirmed, default: false, null: false
      t.boolean :phone_confirmed, default: false, null: false
      t.boolean :allow_mail, default: true, null: false
      t.boolean :bot, default: false, null: false
      t.date :birthday
      t.datetime :last_seen
      t.integer :gender, limit: 2
      t.integer :inviter_id
      t.integer :invitee_count, default: 0, null: false
      t.integer :max_depth, limit: 2, default: 16, null: false
      t.integer :fractals_count, default: 0, null: false
      t.integer :words_count, default: 0, null: false
      t.integer :follower_count, default: 0, null: false
      t.integer :followee_count, default: 0, null: false
      t.string :slug, null: false
      t.string :screen_name, null: false, index: true
      t.string :email, null: false, index: true
      t.string :password_digest
      t.string :name
      t.string :phone
      t.string :image
      t.string :notice
    end

    add_foreign_key :users, :users, column: :inviter_id, on_update: :cascade, on_delete: :nullify
    add_index :users, :slug, unique: true
  end
end
