class CreatePortfolios < ActiveRecord::Migration[7.0]
  def change
    create_table :portfolios do |t|
      t.string :name, null: false
      t.string :date, null: false
      t.json :tag, null: false
      t.string :topImg, null: false
      t.string :front_url
      t.string :back_url
      t.string :front_github
      t.string :back_github
      t.string :color
      t.string :about
      t.string :aboutImg
      t.string :function
      t.string :functionImg
      t.string :appeal
      t.string :appealImg
      t.json :front_skill
      t.json :back_skill
      t.json :infra_skill
      t.string :time, null: false
      t.string :prev_title
      t.string :prev_article_id
      t.string :next_title
      t.string :next_article_id

      t.timestamps
    end
  end
end