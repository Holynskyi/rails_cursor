class CreateTasksAndAddToUser < ActiveRecord::Migration
  def change

    create_table :tasks do |t|
      t.string :name
      t.string :description
      t.string :status, default: :new
    end

    create_table :tasks_users, id: false do |t|
      t.belongs_to :user, index: true
      t.belongs_to :task, index: true
    end
  end
end


