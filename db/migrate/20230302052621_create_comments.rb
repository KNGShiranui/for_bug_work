class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.string :name
      t.text :content, null: false
      t.references :blog, foreign_key: true

      t.timestamps
    end
  end
end
