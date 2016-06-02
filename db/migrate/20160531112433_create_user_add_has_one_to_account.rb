class CreateUserAddHasOneToAccount < ActiveRecord::Migration

  def change
    create_table :users do |t|
      t.string :email, null: false
      t.string :password, limit: 100, null: false
      t.timestamps null: false
    end
    add_index :users, :email, unique: true
    add_reference :accounts, :user, index: true
  end

end
