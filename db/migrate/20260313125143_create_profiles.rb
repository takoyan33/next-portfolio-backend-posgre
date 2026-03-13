class CreateProfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :profiles do |t|
      t.string :content, null: false
      t.string :hobby, null: false
      t.string :license, null: false

      t.timestamps
    end
  end
end
