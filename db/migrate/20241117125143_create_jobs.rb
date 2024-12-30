class CreateJobs < ActiveRecord::Migration[7.0]
  def change
    create_table :jobs do |t|
      t.string :title, null: false
      t.string :date, null: false
      t.string :body, null: false

      t.timestamps
    end
  end
end
