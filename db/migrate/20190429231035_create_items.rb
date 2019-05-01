class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.references :product, foreign_key: true
      t.decimal :price
      t.boolean :sold

      t.timestamps
    end
  end
end
