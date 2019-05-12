class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.references :stock, foreign_key: true
      t.boolean :sold

      t.timestamps
    end
  end
end
