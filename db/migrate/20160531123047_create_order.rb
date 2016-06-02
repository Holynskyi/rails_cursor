class CreateOrder < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.belongs_to :user, index: true
      t.datetime :order_date
      t.boolean :completed, default: false
      t.string :status, default: :new
    end
  end
end
