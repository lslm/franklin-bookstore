class CreateReturns < ActiveRecord::Migration[5.2]
  def change
    create_table :returns do |t|
      t.references :user, foreign_key: true
      t.references :item, foreign_key: true
      t.string :return_reason
      t.string :status

      t.timestamps
    end
  end
end
