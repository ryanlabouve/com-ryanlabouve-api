class CreateArticles < ActiveRecord::Migration[5.0]
  def change
    create_table :articles do |t|
      t.string :title
      t.text :content
      t.date :date
      t.string :description
      t.string :slug

      t.timestamps
    end
  end
end
